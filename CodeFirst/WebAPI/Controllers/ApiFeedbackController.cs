using CodeFirst.Data;
using CodeFirst.Models.Entities;
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
                        .Where(f => f.BranchId == branchId && f.isShowFeedback == true)
                        .Include(f => f.User) // Nạp thông tin người dùng
                        .OrderByDescending(f => f.FeedbackDate) // Sắp xếp giảm dần theo FeedbackDate
                        .ToList();

            if (feedbacks == null)
            {
                return NotFound();
            }

            return Ok(feedbacks);
        }
        [HttpPost]
        public IActionResult CreateFeedback([FromBody] FeedbackModel feedbackModel)
        {
            try
            {
                if (feedbackModel == null)
                {
                    return BadRequest("Dữ liệu phản hồi không hợp lệ");
                }

                // Tạo một đối tượng Feedback từ dữ liệu đầu vào
                var feedback = new Feedback
                {
                    UserId = feedbackModel.UserId,
                    FeedbackDate = DateTime.Now, // Đặt ngày phản hồi thành ngày hiện tại
                    Content = feedbackModel.Content,
                    Rating = feedbackModel.Rating,
                    BranchId = feedbackModel.BranchId,
                    isShowFeedback = true,
                };

                // Thêm đối tượng phản hồi mới vào cơ sở dữ liệu
                _context.Feedback.Add(feedback);
                _context.SaveChanges();

                return Ok("Phản hồi đã được tạo thành công");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
