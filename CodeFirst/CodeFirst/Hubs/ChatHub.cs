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
using CodeFirst.Models.Entities;
namespace CodeFirst.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserService _userService;
        public ChatHub(ApplicationDbContext context, UserService userServer, IHttpContextAccessor httpContextAccessor, UserService userService)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
            _userService = userService;
        }


        //
        public async Task SendBranchCreatedNotification()
        {
            await Clients.All.SendAsync("BranchCreated");
        }
        //

        public async Task CallLoadChatData()
        {
            await Clients.All.SendAsync("LoadChatData");
        }
        public async Task SendUpdatedNotifications(List<Notification> notifications)
        {
            await Clients.All.SendAsync("ReceiveNotificationRealtime", notifications);
        }
        public async Task SendUpdatedChatPrivate(List<ChatPrivate> chatPrivates)
        {
            await Clients.All.SendAsync("ReceiveChatPrivateRealtime", chatPrivates);
        }
        public async Task NotifyTyping(bool isTyping, string receiverConnectionId)
        {
            var emailUserCurrent = Context.User.Identity.Name;
            var userCurrent = await _context.ApplicationUser.FirstOrDefaultAsync(user => user.Email == emailUserCurrent);
            await Clients.User(receiverConnectionId).SendAsync("ReceiveTypingNotification", userCurrent, isTyping);
        }
        //public async Task NotifyTypingChatPrivate(bool isTyping)
        //{
        //    var emailUserCurrent = Context.User.Identity.Name;
        //    var userCurrent = await _context.ApplicationUser.FirstOrDefaultAsync(user => user.Email == emailUserCurrent);
        //    await Clients.All.SendAsync("ReceiveTypingNotification", userCurrent, isTyping);
        //}

        public async Task SendNotificationToAll(string message)
        {
            await Clients.All.SendAsync("ReceivedNotification", message);
        }

        public static readonly Dictionary<string, UserInformation> ConnectedUsers = new Dictionary<string, UserInformation>();
        public static readonly Dictionary<string, UserInfo> UserIds = new Dictionary<string, UserInfo>();
        public override async Task OnConnectedAsync()
        {
            var currentUser = await _userService.GetCurrentLoggedInUser();
            if(currentUser != null)
            {
                var userId = currentUser.Id;
                var username = currentUser.FirstName + " " + currentUser.LastName;
                UserIds[Context.ConnectionId] = new UserInfo { UserId = userId, Username = username };

                UserInformation userInfo = await GetUserInfoFromContext();
                if (!ConnectedUsers.ContainsKey(Context.ConnectionId))
                {
                    ConnectedUsers[Context.ConnectionId] = userInfo;
                    await Clients.Caller.SendAsync("ReceivedNotificationWelcome", $"xin chào {userInfo.FirstName} {userInfo.LastName} hehe");
                    await Clients.All.SendAsync("LoadChatData");
                }
                await Clients.Others.SendAsync("ReceivedNotificationUserOnline", $"{userInfo.FirstName} {userInfo.LastName}");
                await UpdateConnectedUsersList();
                await UpdateConnectedUsersOnlineList();
                await UpdateConnectedUsersOfflineList(ConnectedUsers.Values.ToList());
            }
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            string connectionId = Context.ConnectionId;
            if (ConnectedUsers.ContainsKey(connectionId))
            {
                ConnectedUsers.Remove(connectionId);
                await UpdateConnectedUsersList();
                await UpdateConnectedUsersOnlineList();
                await UpdateConnectedUsersOfflineList(ConnectedUsers.Values.ToList());
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
            var userOfflineList = await _context.ApplicationUser
                                    .Select(user => new UserInformation
                                    {
                                        Id = user.Id,
                                        Email = user.Email,
                                        Avatar = user.Avatar,
                                        FirstName = user.FirstName,
                                        LastName = user.LastName
                                    })
                                    .ToListAsync();

            var offlineUsers = userOfflineList.Where(user => !userOnlineList.Any(u => u.Email == user.Email)).ToList();

            await Clients.All.SendAsync("UpdateUsersOfflineList", offlineUsers);
        }
        public async Task GetUserId()
        {
            string userId = UserIds.ContainsKey(Context.ConnectionId) ? UserIds[Context.ConnectionId].UserId : "";
            string username = UserIds.ContainsKey(Context.ConnectionId) ? UserIds[Context.ConnectionId].Username : "";
            await Clients.Caller.SendAsync("ReceiveUserId", userId, username);
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