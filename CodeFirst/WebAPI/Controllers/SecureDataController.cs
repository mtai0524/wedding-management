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
        [Authorize]
        public IActionResult GetSecureData()
        {
            var userEmail = User.FindFirst(ClaimTypes.Email)?.Value;

            var secureData = new
            {
                message = "Đây là dữ liệu bảo mật.",
                user = userEmail
            };

            return Ok(secureData);
        }
    }
}
