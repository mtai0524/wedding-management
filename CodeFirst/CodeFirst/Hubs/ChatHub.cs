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
using System.Linq;
namespace CodeFirst.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;
        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task CallLoadChatData()
        {
            await Clients.All.SendAsync("LoadChatData");
        }
        public async Task SendUpdatedNotifications(List<Notification> notifications)
        {
            await Clients.All.SendAsync("ReceiveNotificationRealtime", notifications);
        }
        public async Task NotifyTyping(bool isTyping)
        {
            var emailUserCurrent = Context.User.Identity.Name;
            var userCurrent = await _context.ApplicationUser.FirstOrDefaultAsync(user => user.Email == emailUserCurrent);
            await Clients.All.SendAsync("ReceiveTypingNotification", userCurrent, isTyping);
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
            userList = ConnectedUsers.Values.ToList();
            userOnlineList = userList;
            await UpdateConnectedUsersList();
            await UpdateConnectedUsersOnlineList();
            await UpdateConnectedUsersOfflineList(userOnlineList);
           
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
                userList = ConnectedUsers.Values.ToList();
                userOnlineList = userList;
                await UpdateConnectedUsersOfflineList(userOnlineList);
            }
        }
        List<UserInformation> userList = new List<UserInformation>();
        List<UserInformation> userOnlineList = new List<UserInformation>();

        private async Task UpdateConnectedUsersList()
        {
            List<UserInformation> userOnline = ConnectedUsers.Values.ToList();
            await Clients.All.SendAsync("UpdateUsersList", userOnline);
        }


        private async Task UpdateConnectedUsersOfflineList(List<UserInformation> userOnlineList)
        {
            var email = Context.User.Identity.Name;
            var currUser = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == email);
            var userOfflineList = await _context.ApplicationUser
                                    .Select(user => new UserInformation
                                    {
                                        Id = user.Id,
                                        CurrUserId = currUser.Id,
                                        Email = user.Email,
                                        Avatar = user.Avatar,
                                        FirstName = user.FirstName,
                                        LastName = user.LastName
                                    })
                                    .ToListAsync();

            var offlineUsers = userOfflineList.Where(user => !userOnlineList.Any(u => u.Email == user.Email)).ToList();

            await Clients.All.SendAsync("UpdateUsersOfflineList", offlineUsers);
        }
       
        private async Task UpdateConnectedUsersOnlineList()
        {
            List<UserInformation> userOnline = ConnectedUsers.Values.ToList();
            await Clients.All.SendAsync("UpdateUsersOnlineList", userOnline);
        }
        private async Task<UserInformation> GetUserInfoFromContext()
        {
            var email = Context.User.Identity.Name;
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == email);
            if (user != null)
            {
                return new UserInformation
                {
                    Id = user.Id,
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