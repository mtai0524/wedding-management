using CodeFirst.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebAPI.Models;
using WebAPI.Repositories;

namespace WebAPI.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountRepository accountRepo;
        private readonly UserManager<ApplicationUser> _userManager;

        public AccountsController(IAccountRepository repo, UserManager<ApplicationUser> userManager)
        {
            accountRepo = repo;
            _userManager = userManager;
        }

        [HttpPost("SignUp")]
        public async Task<IActionResult> SignUp(SignUpModel signUpModel)
        {
            var result = await accountRepo.SignUpAsync(signUpModel);
            if (result.Succeeded)
            {
                return Ok(result.Succeeded);
            }

            return Unauthorized();
        }

        [HttpPost("SignIn")]
        public async Task<IActionResult> SignIn(SignInModel signInModel)
        {
            var token = await accountRepo.SignInAsync(signInModel);

            if (string.IsNullOrEmpty(token))
            {
                return Unauthorized();
            }

            return Ok(new { token });
        }
        [Authorize] // Đảm bảo chỉ người dùng đã đăng nhập mới có quyền truy cập
        [HttpGet("GetUserInfo")]
        public IActionResult GetUserInfo()
        {
            var userEmail = User.Identity.Name; // Lấy địa chỉ email của người dùng từ token
                                                // Tìm và trả về thông tin người dùng dựa trên địa chỉ email (hoặc ID) ở đây

            // Ví dụ: Trả về thông tin người dùng dưới dạng đối tượng JSON
            var userInfo = new
            {
                Email = userEmail,
                FullName = "John Doe", // Thay thế bằng thông tin người dùng thực tế
                                       // Các thông tin khác về người dùng
            };

            return Ok(userInfo);
        }

    }
}