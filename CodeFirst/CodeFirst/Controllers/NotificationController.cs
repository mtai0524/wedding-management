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
                    .ToListAsync();

                // Định dạng ngày tháng năm và chọn các thuộc tính khác của Notification (nếu có)
                var formattedNotifications = notifications.Select(n => new
                {
                    n.Id,
                    n.Username,
                    n.Message,
                    n.MessageType,
                    NotificationDateTime = n.NotificationDateTime.ToString("HH:mm dd/MM/yyyy"),
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
                // Convert the view model to the Notification entity
                var notification = new Notification
                {
                    Username = $"{user.FirstName} {user.LastName}",
                    Message = model.Message,
                    MessageType = model.MessageType,
                    NotificationDateTime = DateTime.Now
                };
                dbContext.Notifications.Add(notification);
                await dbContext.SaveChangesAsync();
                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
                await hubContext.Clients.All.SendAsync("ReceivedNotification", "đại ka ơi có thông tin mới!!");
                switch (notification.MessageType)
                {

                    case "Personal":
                        await hubContext.Clients.User(notification.Username).SendAsync("ReceivedPersonalNotification", notification.Message, notification.Username);
                        break;

                    case "Group":
                        await hubContext.Clients.Group(notification.Username).SendAsync("ReceivedPersonalNotification", notification.Message, notification.Username);
                        break;

                    default:
                        // Xử lý trường hợp loại thông báo không hợp lệ
                        break;
                }

                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
                return RedirectToAction("Index");
            }

            return View("Index", model);
        }
    }
}
