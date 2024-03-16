using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using CodeFirst.Models.Notifications;
using CodeFirst.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Controllers
{
    public class ChatController : Controller
    {
        private readonly IHubContext<ChatHub> hubContext;
        private readonly ApplicationDbContext dbContext;
        private readonly UserManager<ApplicationUser> _userManager;

        public ChatController(ApplicationDbContext dbContext, IHubContext<ChatHub> hubContext, UserManager<ApplicationUser> userManager)
        {
            this.hubContext = hubContext;
            this.dbContext = dbContext;
            _userManager = userManager;
        }
        [HttpGet]
        public async Task<IActionResult> GetMessages()
        {
            try
            {
                var notifications = await dbContext.Chats
                    
                    .ToListAsync();

                // Định dạng ngày tháng năm và chọn các thuộc tính khác của Notification (nếu có)
                var formattedNotifications = notifications.Select(n => new
                {
                    n.Id,
                    n.Username,
                    n.Message,
                    n.MessageType,
                    NotificationDateTime = n.NotificationDateTime.ToString("HH:mm dd/MM/yyyy"),
                    n.Avatar,
                });


                return Ok(formattedNotifications);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        [HttpPost]
        public async Task<IActionResult> SendMessages(ChatViewModel model)
        {
            var user = await _userManager.GetUserAsync(User);
            if (ModelState.IsValid)
            {
                var notification = new Chat
                {
                    Username = $"{user.FirstName} {user.LastName}",
                    Message = model.Message,
                    MessageType = "All",
                    NotificationDateTime = DateTime.Now,
                    Avatar = !string.IsNullOrEmpty(user.Avatar) ? user.Avatar : "https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg",

                };
                dbContext.Chats.Add(notification);
                await dbContext.SaveChangesAsync();
                await hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Chat> { notification });
            }
            return RedirectToAction("Index", "Chat", model);
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
