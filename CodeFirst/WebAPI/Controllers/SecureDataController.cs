using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SecureDataController : ControllerBase
    {
        [HttpGet("secure-data")]
        [Authorize] // Đảm bảo chỉ có người dùng đã đăng nhập mới có thể truy cập
        public IActionResult GetSecureData()
        {
            // Lấy thông tin người dùng từ token
            var userEmail = User.FindFirst(ClaimTypes.Email)?.Value;

            // Đây là ví dụ, bạn có thể thay đổi dữ liệu trả về tùy ý
            var secureData = new
            {
                message = "Đây là dữ liệu bảo mật.",
                user = userEmail
            };

            return Ok(secureData);
        }
    }
}
