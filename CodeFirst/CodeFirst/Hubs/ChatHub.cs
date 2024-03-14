using AutoMapper;
using CodeFirst.Data;
using Microsoft.AspNetCore.SignalR;
using CodeFirst.Chat.Model;
using CodeFirst.Models;
using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using CodeFirst.ViewModels;
namespace CodeFirst.Hubs
{
    public class ChatHub: Hub
    {
        private readonly ApplicationDbContext _context;

        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task SendNotificationToAll(string message)
        {
            await Clients.All.SendAsync("ReceivedNotification", message);
        }

        public async Task SendNotificationToClient(string message, string username)
        {
            var hubConnections = await _context.HubConnections.Where(con => con.Username == username).ToListAsync();
            foreach (var hubConnection in hubConnections)
            {
                await Clients.Client(hubConnection.ConnectionId).SendAsync("ReceivedPersonalNotification", message, username);
            }
        }
        //public async Task SendNotificationToGroup(string message, string group)
        //{
        //    var hubConnections = await _context.HubConnections.Join(_context.ApplicationUser, c => c.Username, o => o.Username, (c, o) => new { c.Username, c.ConnectionId, o.Dept }).Where(o => o.Dept == group).ToListAsync();
        //    foreach (var hubConnection in hubConnections)
        //    {
        //        string username = hubConnection.Username;
        //        await Clients.Client(hubConnection.ConnectionId).SendAsync("ReceivedPersonalNotification", message, username);
        //        //Call Send Email function here
        //    }
        //}
        private static readonly Dictionary<string, UserInformation> ConnectedUsers = new Dictionary<string, UserInformation>();

        public override async Task OnConnectedAsync()
        {
            Clients.Caller.SendAsync("OnConnected");

            UserInformation userInfo = await GetUserInfoFromContext(); 

            string connectionId = Context.ConnectionId;
            ConnectedUsers[connectionId] = userInfo;

            await UpdateConnectedUsersList(); 
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            string connectionId = Context.ConnectionId;
            if (ConnectedUsers.ContainsKey(connectionId))
            {
                UserInformation userInfo = ConnectedUsers[connectionId];
                ConnectedUsers.Remove(connectionId);

                await UpdateConnectedUsersList(); 
            }

            await base.OnDisconnectedAsync(exception);
        }

        private async Task UpdateConnectedUsersList()
        {
            List<UserInformation> userList = ConnectedUsers.Values.ToList();
            await Clients.All.SendAsync("UpdateUsersList", userList);
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
                    Avatar = user.Avatar
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




        //public async Task Join(string roomName)
        //{
        //    try
        //    {
        //        var user = _Connections.Where(u => u.Username == IdentityName).FirstOrDefault();
        //        if (user != null && user.CurrentRoom != roomName)
        //        {
        //            // Remove user from others list
        //            if (!string.IsNullOrEmpty(user.CurrentRoom))
        //                await Clients.OthersInGroup(user.CurrentRoom).SendAsync("removeUser", user);

        //            // Join to new chat room
        //            await Leave(user.CurrentRoom);
        //            await Groups.AddToGroupAsync(Context.ConnectionId, roomName);
        //            user.CurrentRoom = roomName;

        //            // Tell others to update their list of users
        //            await Clients.OthersInGroup(roomName).SendAsync("addUser", user);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        await Clients.Caller.SendAsync("onError", "You failed to join the chat room!" + ex.Message);
        //    }
        //}
        //public async Task Leave(string roomName)
        //{
        //    await Groups.RemoveFromGroupAsync(Context.ConnectionId, roomName);
        //}

        //private string IdentityName
        //{
        //    get { return Context.User.Identity.Name; }
        //}


        //public override Task OnConnectedAsync()
        //{
        //    try
        //    {
        //        var user = _context.ApplicationUser.Where(u => u.UserName == IdentityName).FirstOrDefault(); // thay ApplicationUser cho Users

        //        var userViewModel = _mapper.Map<ApplicationUser, UserViewChatModel>((ApplicationUser)user);

        //        userViewModel.Device = GetDevice();
        //        userViewModel.CurrentRoom = "";

        //        if (!_Connections.Any(u => u.Username == IdentityName))
        //        {
        //            _Connections.Add(userViewModel);
        //            _ConnectionsMap.Add(IdentityName, Context.ConnectionId);
        //        }

        //        Clients.Caller.SendAsync("getProfileInfo", user.Email, user.Avatar); // thay ApplicationUser cho Users
        //    }
        //    catch (Exception ex)
        //    {
        //        Clients.Caller.SendAsync("onError", "OnConnected:" + ex.Message);
        //    }
        //    return base.OnConnectedAsync();
        //}

        // public IEnumerable<UserViewChatModel> GetUsers(string roomName)
        //{
        //    return _Connections.Where(u => u.CurrentRoom == roomName).ToList();
        //}


        //private string GetDevice()
        //{
        //    var device = Context.GetHttpContext().Request.Headers["Device"].ToString();
        //    if (!string.IsNullOrEmpty(device) && (device.Equals("Desktop") || device.Equals("Mobile")))
        //        return device;

        //    return "Web";
        //}

        //public override Task OnDisconnectedAsync(Exception exception)
        //{
        //    try
        //    {
        //        var user = _Connections.Where(u => u.Username == IdentityName).First();
        //        _Connections.Remove(user);

        //        // Tell other users to remove you from their list
        //        Clients.OthersInGroup(user.CurrentRoom).SendAsync("removeUser", user);

        //        // Remove mapping
        //        _ConnectionsMap.Remove(user.Username);
        //    }
        //    catch (Exception ex)
        //    {
        //        Clients.Caller.SendAsync("onError", "OnDisconnected: " + ex.Message);
        //    }

        //    return base.OnDisconnectedAsync(exception);
        //}

        //public async Task SendPrivate(string receiverName, string message)
        //{
        //    if (_ConnectionsMap.TryGetValue(receiverName, out string userId))
        //    {
        //        // Who is the sender;
        //        var sender = _Connections.Where(u => u.Username == IdentityName).First();

        //        if (!string.IsNullOrEmpty(message.Trim()))
        //        {
        //            // Build the message
        //            var messageViewModel = new MessageViewModel()
        //            {
        //                Content = Regex.Replace(message, @"<.*?>", string.Empty), // match bất kì kí tự nào
        //                From = sender.FullName,
        //                Avatar = sender.Avatar,
        //                Room = "",
        //                Timestamp = DateTime.Now.ToLongTimeString()
        //            };

        //            // Send the message
        //            await Clients.Client(userId).SendAsync("newMessage", messageViewModel);
        //            await Clients.Caller.SendAsync("newMessage", messageViewModel);
        //        }
        //    }
        //}
    }
}
