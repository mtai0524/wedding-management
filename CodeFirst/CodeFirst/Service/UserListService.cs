using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class UserListService
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public UserListService(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            this._context = context;
            _userManager = userManager;
        }
        public async Task<List<ApplicationUserWithRole>> GetListUserAndRole()
        {
            var users = await _context.ApplicationUser.ToListAsync();
            List<ApplicationUserWithRole> listUserRole = new List<ApplicationUserWithRole>();
            foreach(var user in users)
            {
                var usr = await _userManager.GetRolesAsync(user);
                listUserRole.Add(new ApplicationUserWithRole
                {
                    UserId = user.Id,
                    Username = user.UserName,
                    Role = usr.FirstOrDefault(),
                    Email = user.Email,
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    PhoneNumber = !string.IsNullOrEmpty(user.PhoneNumber)? user.PhoneNumber : "chưa nhập...",
                    Avatar = user.Avatar,
                    LockoutEnabled = user.LockoutEnabled,
                    LockoutEnd = user.LockoutEnd,
                    FullName = user.FirstName + " " + user.LastName,
                });
            }
            return listUserRole;
        }

    }
}
