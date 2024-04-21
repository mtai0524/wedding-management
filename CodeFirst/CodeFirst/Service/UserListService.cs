using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class UserListService
    {
        private readonly ApplicationDbContext _context;

        public UserListService(ApplicationDbContext context)
        {
            this._context = context;
        }
        public async Task<List<ApplicationUser>> GetListUser()
        {
            var user = await _context.ApplicationUser.ToListAsync();
            return user;
        }
    }
}
