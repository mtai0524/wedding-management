using CodeFirst.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;

namespace CodeFirst.Service
{
    public class AuthorizeService
    {
        private readonly ApplicationDbContext _context;
        private readonly RoleManager<IdentityRole> RoleManager;

        public AuthorizeService(ApplicationDbContext context, RoleManager<IdentityRole> roleManager)
        {
            _context = context;
            RoleManager = roleManager;
        }
        public async Task<string> UserHasPermission(string type)
        {
            List<string> roleNames = new List<string>();
            string roleNameAu = "";
            var permissionList = await _context.Permission.Where(x => x.Type == type).ToListAsync();

            foreach (var p in permissionList)
            {

                if (p != null)
                {
                    var role = await RoleManager.FindByIdAsync(p.RoleId);
                    roleNames.Add(role.Name);
                }
            }
            roleNameAu = string.Join(", ", roleNames);
            return roleNameAu;
        }
    }
}
