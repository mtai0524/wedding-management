using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models;
using CodeFirst.Models.Notifications;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
namespace SignalRYoutube.Controllers
{
    public class NotificationController : Controller
    {
        private readonly IHubContext<ChatHub> hubContext;
        private readonly ApplicationDbContext dbContext;
        private readonly UserManager<ApplicationUser> _userManager;

        public NotificationController(ApplicationDbContext dbContext, IHubContext<ChatHub> hubContext, UserManager<ApplicationUser> userManager)
        {
            this.hubContext = hubContext;
            this.dbContext = dbContext;
            _userManager = userManager;
        }


        [HttpGet]
        public async Task<IActionResult> GetNotifications()
        {
            try
            {
                var notifications = await dbContext.Notifications
                    .OrderByDescending(n => n.NotificationDateTime)
                    .Include(x => x.User)
                    .ToListAsync();

                // Định dạng ngày tháng năm và chọn các thuộc tính khác của Notification (nếu có)
                var formattedNotifications = notifications.Select(n => new
                {
                    n.Id,
                    n.Message,
                    n.MessageType,
                    NotificationDateTime = n.NotificationDateTime.ToString("HH:mm dd/MM/yyyy"),
                    User = n.User != null ? new
                    {
                        n.User.FirstName,
                        n.User.LastName,
                        n.User.Avatar,
                    } : null,
                });


                return Ok(formattedNotifications);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        //public async Task<IActionResult> Index()
        //{
        //    var user = await _userManager.GetUserAsync(User);
        //    ViewBag.CurrentUsername = user.FirstName + user.LastName;
        //    return View();
        //}
        public IActionResult Index()
        {
            
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SendNotification(NotificationViewModel model)
        {
            var user = await _userManager.GetUserAsync(User);
            if (ModelState.IsValid)
            {
                var notification = new Notification
                {
                    UserId = user.Id,
                    Message = model.Message,
                    MessageType = "All",
                    NotificationDateTime = DateTime.Now,
                };
                dbContext.Notifications.Add(notification);
                await dbContext.SaveChangesAsync();
                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
                await hubContext.Clients.All.SendAsync("ReceivedNotification", "đại ka ơi có thông tin mới!!");
              

                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
            }
            return RedirectToAction("Index", "Chat", model);
        }
    }
}
