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

        public async Task FeedbackList()
        {
            List<Feedback> feedbacks = await _context.Feedback.ToListAsync();

            await Clients.All.SendAsync("FeedbackList", feedbacks);
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

        public async Task SendPromotionCreatedNotification()
        {
            var listPromotion = await _context.Code.ToListAsync();
            await Clients.All.SendAsync("PromotionCreated", listPromotion);
        }

        public async Task SendInvoiceNotification()
        {
            var listInvoice = _context.Invoice.ToListAsync();
            await Clients.All.SendAsync("InvoiceCreated", listInvoice);
        }


        public async Task SendHallCreatedNotification()
        {
            var listHall = _context.Hall.ToListAsync();


            await Clients.All.SendAsync("HallCreated", listHall);
        }
        public async Task SendTimeOfDayCreatedNotification()
        {
            var listTimeOfDay = _context.TimeOfDay.ToListAsync();


            await Clients.All.SendAsync("TimeOfDay", listTimeOfDay);
        }
        public async Task SendMenuCreatedNotification()
        {
            var listMenu = _context.MenuEntity.ToListAsync();
            await Clients.All.SendAsync("MenuCreated", listMenu);
        }
        public async Task SendMenuCateCreatedNotification()
        {
            var listMenuCate = _context.MenuCategory.ToListAsync();
            await Clients.All.SendAsync("MenuCateCreated", listMenuCate);
        }

        public async Task SendServiceCreatedNotification()
        {
            var listMenu = _context.ServiceEntity.ToListAsync();
            await Clients.All.SendAsync("ServiceCreated", listMenu);
        }
        public async Task SendServiceCateCreatedNotification()
        {
            var listMenuCate = _context.ServiceCategory.ToListAsync();
            await Clients.All.SendAsync("ServiceCateCreated", listMenuCate);
        }
    }
}
