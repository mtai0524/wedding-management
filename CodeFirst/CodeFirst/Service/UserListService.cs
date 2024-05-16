﻿using CloudinaryDotNet.Actions;
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
        private readonly RoleManager<IdentityRole> _roleManager;

        public UserListService(ApplicationDbContext context, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            this._context = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }
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
        public async Task<string> GetRoleUserByUserId(string id)
        {
            var user = await _userManager.FindByIdAsync(id);
            IList<string> roles = new List<string>();
            string role = "";
            if (user != null)
            {
                roles = await _userManager.GetRolesAsync(user);
                role = roles.FirstOrDefault();
            }
            return role;
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
        public async Task<List<string>> GetRoleUserAsync(string userId)
        {
            ApplicationUser? userFindByUserId = _context.ApplicationUser.FirstOrDefault(x => x.Id == userId);

            var userRoles = await _userManager.GetRolesAsync(userFindByUserId);

            // Join the roles into a single string, separated by commas
            return (List<string>)userRoles;
        }

    }
}
