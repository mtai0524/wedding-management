using AutoMapper;
using CodeFirst.Data;
using Microsoft.AspNetCore.SignalR;
using CodeFirst.Models;
using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using CodeFirst.ViewModels;
using CodeFirst.Models.Notifications;
using CodeFirst.Service;
namespace CodeFirst.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;
        private readonly OnlineUserService _onlineUserService;
        public ChatHub(ApplicationDbContext context, OnlineUserService onlineUserService)
        {
            _context = context;
            _onlineUserService = onlineUserService;
        }
        public async Task CallLoadChatData()
        {
            await Clients.All.SendAsync("LoadChatData");
        }
        public async Task SendUpdatedNotifications(List<Notification> notifications)
        {
            await Clients.All.SendAsync("ReceiveNotificationRealtime", notifications);
        }

        public async Task SendNotificationToAll(string message)
        {
            await Clients.All.SendAsync("ReceivedNotification", message);
        }

        public static readonly Dictionary<string, UserInformation> ConnectedUsers = new Dictionary<string, UserInformation>();

        public override async Task OnConnectedAsync()
        {
            Clients.Caller.SendAsync("OnConnected");

            UserInformation userInfo = await GetUserInfoFromContext();
            if (!ConnectedUsers.ContainsKey(Context.ConnectionId))
            {
                await Clients.Caller.SendAsync("ReceivedNotificationWelcome", $"xin chào {userInfo.FirstName} {userInfo.LastName} hehe");
                await Clients.All.SendAsync("LoadChatData");
            }
            await Clients.Others.SendAsync("ReceivedNotificationUserOnline", $"{userInfo.FirstName} {userInfo.LastName}");
            string connectionId = Context.ConnectionId;
            ConnectedUsers[connectionId] = userInfo;
            _onlineUserService.AddUser(connectionId, userInfo);
            await UpdateConnectedUsersList();
            await UpdateConnectedUsersOnlineList();
            await UpdateConnectedUsersOfflineList();
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            string connectionId = Context.ConnectionId;
            if (ConnectedUsers.ContainsKey(connectionId))
            {
                UserInformation userInfo = ConnectedUsers[connectionId];
                ConnectedUsers.Remove(connectionId);

                await UpdateConnectedUsersList();
                await UpdateConnectedUsersOnlineList();
                await UpdateConnectedUsersOfflineList();
            }

            await base.OnDisconnectedAsync(exception);
        }

        private async Task UpdateConnectedUsersList()
        {
            List<UserInformation> userList = ConnectedUsers.Values.ToList();

            await Clients.All.SendAsync("UpdateUsersList", userList);
        }


        private async Task UpdateConnectedUsersOfflineList()
        {
            List<ApplicationUser> userList = await _context.ApplicationUser.Take(8).ToListAsync();
            await Clients.All.SendAsync("UpdateUsersOfflineList", userList);
        }

        private async Task UpdateConnectedUsersOnlineList()
        {
            List<UserInformation> userList = ConnectedUsers.Values.ToList();
            await Clients.All.SendAsync("UpdateUsersOnlineList", userList);
        }

        private async Task<UserInformation> GetUserInfoFromContext()
        {
            var email = Context.User.Identity.Name;
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == email);

            if (user != null)
            {
                return new UserInformation
                {
                    Email = user.Email,
                    Avatar = user.Avatar,
                    FirstName = user.FirstName,
                    LastName = user.LastName
                };
            }
            else
            {
                return new UserInformation
                {
                    Email = "guest@example.com",
                    Avatar = null
                };
            }
        }

    }
}