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
namespace CodeFirst.Hubs
{
    public class ChatHub: Hub
    {
        private readonly ApplicationDbContext _context;

        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task SendUpdatedNotifications(List<Notification> notifications)
        {
            await Clients.All.SendAsync("ReceiveNotificationRealtime", notifications);
        }

        public async Task SendNotificationToAll(string message)
        {
            await Clients.All.SendAsync("ReceivedNotification", message);
        }
     
        private static readonly Dictionary<string, UserInformation> ConnectedUsers = new Dictionary<string, UserInformation>();

        public override async Task OnConnectedAsync()
        {
            Clients.Caller.SendAsync("OnConnected");

            UserInformation userInfo = await GetUserInfoFromContext();
            if (!ConnectedUsers.ContainsKey(Context.ConnectionId))
            {
                await Clients.Caller.SendAsync("ReceivedNotificationWelcome", $"xin chào {userInfo.FirstName} {userInfo.LastName} hehe");
            }
            await Clients.Others.SendAsync("ReceivedNotificationUserOnline", $"{userInfo.FirstName} {userInfo.LastName}");
            string connectionId = Context.ConnectionId;
            ConnectedUsers[connectionId] = userInfo;

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
            List<ApplicationUser> userList = await _context.ApplicationUser.Take(10).ToListAsync();
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
