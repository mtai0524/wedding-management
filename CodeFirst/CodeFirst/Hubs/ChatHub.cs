using CodeFirst.Models;
using Microsoft.AspNetCore.SignalR;

namespace CodeFirst.Hubs
{
    public class ChatHub : Hub
    {
        public readonly static List<UserViewModel> _Connections = new List<UserViewModel>();

    }
}
