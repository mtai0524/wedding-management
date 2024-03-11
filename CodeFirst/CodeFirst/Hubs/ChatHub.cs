using AutoMapper;
using CodeFirst.Data;
using Microsoft.AspNetCore.SignalR;
using CodeFirst.Chat.Model;
using CodeFirst.Models;
using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
namespace CodeFirst.Hubs
{
    public class ChatHub: Hub
    {
        private readonly ApplicationDbContext _context;

        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }

        private static readonly HashSet<string> ConnectedUsers = new HashSet<string>();

        public override async Task OnConnectedAsync()
        {
            Clients.Caller.SendAsync("OnConnected");

            string username = await GetUsernameFromContext(); // Implement logic to retrieve username

            ConnectedUsers.Add(username);

            await UpdateConnectedUsersList(); // Broadcast the updated list to all clients
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            string username = await GetUsernameFromContext(); // Implement logic to retrieve username

            ConnectedUsers.Remove(username);

            await UpdateConnectedUsersList(); // Broadcast the updated list to all clients

            await base.OnDisconnectedAsync(exception);
        }

        private async Task UpdateConnectedUsersList()
        {
            List<string> userList = ConnectedUsers.ToList(); // Convert to a list for easier client-side handling
            await Clients.All.SendAsync("UpdateUsersList", userList);
        }
        private async Task<string> GetUsernameFromContext()
        {
            var email = Context.User.Identity.Name;
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == email);

            if (user != null)
            {
                return user.Avatar;
            }
            else
            {
                return "Guest";
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
