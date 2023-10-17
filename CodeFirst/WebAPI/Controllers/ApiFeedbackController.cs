using CodeFirst.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebAPI.Controllers
{
    [Route("api/feedback")]
    [ApiController]
    public class ApiFeedbackController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ApiFeedbackController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet("{branchId}")]
        public IActionResult GetFeedbacksByBranch(int branchId)
        {
            var feedbacks = _context.Feedback
                        .Where(f => f.BranchId == branchId)
                        .Include(f => f.Id) // Nạp thông tin người dùng
                        .ToList();

            if (feedbacks == null)
            {
                return NotFound();
            }

            return Ok(feedbacks);
        }
    }
}
