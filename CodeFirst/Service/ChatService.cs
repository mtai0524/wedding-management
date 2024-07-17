using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.MiddlewareExtensions;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using CodeFirst.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace CodeFirst.Services
{
    public class ChatService
    {
        private readonly IHubContext<ChatHub> _hubContext;
        private readonly ApplicationDbContext _dbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IJSRuntime _jsRuntime;
        public ChatService(ApplicationDbContext dbContext, IHubContext<ChatHub> hubContext, UserManager<ApplicationUser> userManager, IHttpContextAccessor httpContextAccessor, IJSRuntime jsRuntime)
        {
            _dbContext = dbContext;
            _hubContext = hubContext;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
            _jsRuntime = jsRuntime;
        }


        public async Task<List<Chat>> GetMessagesAsync()
        {
            try
            {
                var notifications = await _dbContext.Chats.ToListAsync();

                var formattedNotifications = notifications.Select(n => new Chat
                {
                    Id = n.Id,
                    //Username = n.Username,
                    Message = n.Message,
                    MessageType = n.MessageType,
                    NotificationDateTime = n.NotificationDateTime,
                    Avatar = n.Avatar
                }).ToList();

                return formattedNotifications;
            }
            catch (Exception ex)
            {
                throw; 
            }
        }



        public async Task SendMessage(ChatViewModel model)
        {
            var currentUser = await _httpContextAccessor.HttpContext.GetUserAsync(_userManager);
            var notification = new Chat
            {
                //Username = $"{currentUser.FirstName} {currentUser.LastName}",
                Message = model.Message,
                MessageType = "All",
                NotificationDateTime = DateTime.Now,
                Avatar = !string.IsNullOrEmpty(currentUser.Avatar) ? currentUser.Avatar : "https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg",
            };

            _dbContext.Chats.Add(notification);
            await _dbContext.SaveChangesAsync();
            await _hubContext.Clients.All.SendAsync("ReceiveMessage", notification);
            await _hubContext.Clients.All.SendAsync("ReceiveNotificationRealtime", new List<Chat> { notification });

        }

    }
}
