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

        public IActionResult Index()
        {
            return View();
        }
        [HttpPut("/api/tasks/{id}")]
        public async Task<IActionResult> UpdateTaskPosition(int id, TaskPositionUpdateDto dto)
        {
            var task = await _context.TaskToDo.FindAsync(id);
            if (task == null)
            {
                return NotFound();
            }

            task.Position = dto.Position;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        public class TaskPositionUpdateDto
        {
            public int Position { get; set; }
        }

    }
}
