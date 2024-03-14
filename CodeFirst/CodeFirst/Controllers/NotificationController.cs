using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models.Notifications;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace SignalRYoutube.Controllers
{
    public class NotificationController : Controller
    {
        private readonly IHubContext<ChatHub> hubContext;
        private readonly ApplicationDbContext dbContext;

        public NotificationController(ApplicationDbContext dbContext, IHubContext<ChatHub> hubContext)
        {
            this.hubContext = hubContext;
            this.dbContext = dbContext;
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
                    NotificationDateTime = n.NotificationDateTime.ToString("hh:mm dd/MM/yyyy"),
                });

                return Ok(formattedNotifications);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SendNotification(NotificationViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Convert the view model to the Notification entity
                var notification = new Notification
                {
                    Username = model.Username,
                    Message = model.Message,
                    MessageType = model.MessageType,
                    NotificationDateTime = DateTime.Now
                };
                dbContext.Notifications.Add(notification);
                await dbContext.SaveChangesAsync();
                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });

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
