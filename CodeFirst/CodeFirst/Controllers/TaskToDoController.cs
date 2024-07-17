using CodeFirst.Data;
using CodeFirst.Hubs;
using CodeFirst.Models.Entities;
using CodeFirst.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Build.ObjectModelRemoting;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Controllers
{
    public class TaskToDoController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ProjectService _projectService;
        private readonly IHubContext<MyBlazorHub> _hubContext;

        public TaskToDoController(ApplicationDbContext context, ProjectService projectService, IHubContext<MyBlazorHub> hubContext)
        {
            _context = context;
            _projectService = projectService;
            _hubContext = hubContext;
        }
    
        [HttpPut("/api/tasks/{id}")]
        public async Task<IActionResult> UpdateTaskPosition(int id, [FromBody] TaskPositionUpdateDto newPosition)
        {
            var task = await _context.TaskToDo.FindAsync(id);
            if (task == null)
            {
                return NotFound();
            }

            // chỉ cần cập nhật project thôi , hàm chỉnh sửa pos đã chạy từ trước

            // get project cũ của task
            var oldProjectId = task.ProjectId;

            // check xem projectId có thay đổi không
            if (task.ProjectId != newPosition.ProjectId)
            {
                // Cập nhật projectId của task vừa kéo thả
                task.ProjectId = newPosition.ProjectId;
                var tasksInNewProject = _context.TaskToDo.Where(t => t.ProjectId == newPosition.ProjectId).OrderBy(t => t.Position).ToList();
                int? newPositionValue = tasksInNewProject.Count > 0 ? tasksInNewProject.Last().Position + 1 : 1;
                task.Position = newPositionValue;
            }

            // chức năng cập nhật pos bên js sẽ gọi lại tất cả các task trong project sau đó cập nhật position dựa theo các task đó 
  
            task.Position = newPosition.Position;
            _context.Update(task);
            await _context.SaveChangesAsync();
            List<Project> projectList = await _projectService.GetAllProjects();
            await _hubContext.Clients.All.SendAsync("ProjectCreated", projectList);
            return NoContent();
        }


        public class TaskPositionUpdateDto
        {
            public int Position { get; set; }
            public int ProjectId { get; set; }
        }


    }
}
