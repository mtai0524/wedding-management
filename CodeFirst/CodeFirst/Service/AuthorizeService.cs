using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;

namespace CodeFirst.Service
{
    public class AuthorizeService
    {
        private readonly ApplicationDbContext _context;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;
        public async Task<string> GetRoleId(ApplicationUser userCurr)
        {
            string roleId = "";
            var role = await _userManager.GetRolesAsync(userCurr);
            var roleName = role.FirstOrDefault();
            var identityRole = await _roleManager.FindByNameAsync(roleName);
            if (identityRole != null)
            {
                roleId = identityRole.Id;
            }
            return roleId;
        }
        public AuthorizeService(ApplicationDbContext context, RoleManager<IdentityRole> roleManager, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _roleManager = roleManager;
            _userManager = userManager;
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
                    var role = await _roleManager.FindByIdAsync(p.RoleId);
                    roleNames.Add(role.Name);
                }
            }
            roleNameAu = string.Join(", ", roleNames);
            return roleNameAu;
        }
    }
}
