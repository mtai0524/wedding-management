using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models;
using CodeFirst.Models.Notifications;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace CodeFirst.Service
{
    public class NotificationService
    {
        private readonly ApplicationDbContext _dbContext;
        private readonly IHubContext<ChatHub> _hubContext;
        public NotificationService(
            ApplicationDbContext dbContext,
            IHubContext<ChatHub> hubContext)
        {
            _dbContext = dbContext;
            _hubContext = hubContext;
        }

        public async Task SendNotification(ApplicationUser getUserCurr, string message)
        {
            var notification = new Notification
            {
                UserId = getUserCurr.Id,
                Message = $" {message}" ,
                MessageType = "All",
                NotificationDateTime = DateTime.Now,
            };
            _dbContext.Notifications.Add(notification);
            await _dbContext.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Notification> { notification });
            await _hubContext.Clients.All.SendAsync("ReceivedNotification", "Thông báo mới!!");

        }
    }

}
