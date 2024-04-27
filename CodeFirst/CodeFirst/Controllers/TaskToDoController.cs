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

           

            // Cập nhật vị trí của tác vụ
            task.Position = newPosition.Position;
            _context.Update(task);

            // Cập nhật vị trí của tác vụ bị thay thế (nếu có)
            // Điều này cần được thực hiện ở phía máy khách và gửi thông tin cần thiết đến máy chủ

            await _context.SaveChangesAsync();

            return NoContent();
        }


        public class TaskPositionUpdateDto
        {
            public int Position { get; set; }
        }


    }
}
