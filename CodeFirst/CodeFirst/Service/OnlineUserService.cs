using CodeFirst.Data;
using CodeFirst.ViewModels;
using System.Collections.Concurrent;

namespace CodeFirst.Service
{
    public class OnlineUserService
    {
        private readonly ApplicationDbContext _dbContext;

        public OnlineUserService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        private readonly Dictionary<string, UserInformation> _connectedUsers = new Dictionary<string, UserInformation>();
        public void AddUser(string connectionId, UserInformation userInfo)
        {
            if (userInfo != null)
            {
                _connectedUsers.TryAdd(connectionId, userInfo);
            }
        }

        public async Task<List<UserInformation>> GetOnlineUsersAsync()
        {
            return _connectedUsers.Values.ToList();
        }

    }
}
