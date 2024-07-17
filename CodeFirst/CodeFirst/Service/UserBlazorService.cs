using CloudinaryDotNet.Actions;
using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace CodeFirst.Service
{
    public class UserBlazorService
    {
        private ApplicationUser _currentUser;
        private bool _isLoaded = false;

        private readonly AuthenticationStateProvider _authenticationStateProvider;
        private readonly ApplicationDbContext _context;

        public UserBlazorService(AuthenticationStateProvider authenticationStateProvider, ApplicationDbContext context)
        {
            _authenticationStateProvider = authenticationStateProvider;
            _context = context;
        }
        public async Task<ApplicationUser> GetUserById(string userId)
        {
            return await _context.ApplicationUser.FirstOrDefaultAsync(x => x.Id == userId);
        }
        public async Task<ApplicationUser> GetCurrentUser()
        {
            if (!_isLoaded)
            {
                var authState = await _authenticationStateProvider.GetAuthenticationStateAsync();
                var user = authState.User;
                var userId = user.FindFirstValue(ClaimTypes.NameIdentifier);
                _currentUser = await _context.ApplicationUser.FirstOrDefaultAsync(x => x.Id == userId);
                _isLoaded = true;
            }
            return _currentUser;
        }
    }
}
