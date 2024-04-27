using CodeFirst.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Controllers
{
    public class TaskToDoController : Controller
    {
        private readonly ApplicationDbContext _context;

        public TaskToDoController(ApplicationDbContext context)
        {
            _context = context;
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
            }

            // chức năng cập nhật pos bên js sẽ gọi lại tất cả các task trong project sau đó cập nhật position dựa theo các task đó 
  
            // Cập nhật vị trí của task
            task.Position = newPosition.Position;
            _context.Update(task);

            await _context.SaveChangesAsync();

            return NoContent();
        }



        public class TaskPositionUpdateDto
        {
            public int Position { get; set; }
            public int ProjectId { get; set; }
        }


    }
}
