using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using CodeFirst.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Build.ObjectModelRemoting;
using Microsoft.EntityFrameworkCore;
using static CodeFirst.Controllers.TaskToDoController;

namespace CodeFirst.Hubs
{
    public class MyBlazorHub:Hub
    {
        private readonly ApplicationDbContext _context;
        private readonly ProjectService _projectService;
        private readonly UserManager<ApplicationUser> _userManager;


        public MyBlazorHub(ApplicationDbContext context, ProjectService projectService, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _projectService = projectService;
            _userManager = userManager;
        }
        public async Task SendProjectCreatedNotification()
        {
            List<Project> projectList = await _projectService.GetAllProjects();

            await Clients.Others.SendAsync("ProjectCreated", projectList);
        }
        public async Task SendTaskUpdate(TaskPositionUpdateDto task)
        {
            await Clients.All.SendAsync("TaskUpdated", task);
        }
        public async Task SendTaskCreatedNotification()
        {
            var userService = new UserListService(_context, _userManager);
            var listUser = await userService.GetListUserAndRole();
            await Clients.All.SendAsync("ApplicationUserWithRoleSignalR", listUser);
        }
        public async Task SendBranchCreatedNotification()
        {
            var listBranch = _context.Branch.ToListAsync();
            await Clients.All.SendAsync("BranchCreated", listBranch);
        }
       

       
    }
}
