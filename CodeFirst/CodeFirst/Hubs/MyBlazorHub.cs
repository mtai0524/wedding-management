using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Hubs
{
    public class MyBlazorHub:Hub
    {
        private readonly ApplicationDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserService _userService;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;

        public MyBlazorHub(ApplicationDbContext context, UserService userServer, IHttpContextAccessor httpContextAccessor, UserService userService, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
            _userService = userService;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task SendBranchCreatedNotification()
        {
            var listBranch = _context.Branch.ToListAsync();
            await Clients.All.SendAsync("BranchCreated", listBranch);
        }
    }
}
