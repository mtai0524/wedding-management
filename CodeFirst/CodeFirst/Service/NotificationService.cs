using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models;
using CodeFirst.Models.Notifications;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;

namespace CodeFirst.Service
{
    public class NotificationService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _dbContext;
        private readonly IHubContext<ChatHub> _hubContext;
        private readonly UserService _userService;

        public NotificationService(
            UserManager<ApplicationUser> userManager,
            ApplicationDbContext dbContext,
            IHubContext<ChatHub> hubContext,
            UserService userService)
        {
            _userManager = userManager;
            _dbContext = dbContext;
            _hubContext = hubContext;
            _userService = userService;
        }

        public async Task SendNotification(string message)
        {
            ApplicationUser user = await _userService.GetCurrentLoggedInUser();
            var notification = new Notification
            {
                Username = $"{user.FirstName} {user.LastName}",
                Message = $" {message}" ,
                MessageType = "All",
                NotificationDateTime = DateTime.Now,
                Avatar = !string.IsNullOrEmpty(user.Avatar) ? user.Avatar : "https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg",
            };
            _dbContext.Notifications.Add(notification);
            await _dbContext.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
            await _hubContext.Clients.All.SendAsync("ReceivedNotification", "đại ka ơi có thông tin mới!!");

            switch (notification.MessageType)
            {
                case "Personal":
                    await _hubContext.Clients.User(notification.Username).SendAsync("ReceivedPersonalNotification", notification.Message, notification.Username);
                    break;

                case "Group":
                    await _hubContext.Clients.Group(notification.Username).SendAsync("ReceivedPersonalNotification", notification.Message, notification.Username);
                    break;

                default:
                    break;
            }

            await _hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
        }
    }

}
