using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        private readonly ApplicationDbContext _context;

        public AccountsController(IAccountRepository repo, UserManager<ApplicationUser> userManager, ApplicationDbContext context)
        {
            accountRepo = repo;
            _userManager = userManager;
            _context = context;
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
        [HttpPost("GetUserInfo")]
        public async Task<IActionResult> GetUserInfoAsync([FromBody] string email)
        {
            // Sử dụng email để truy vấn thông tin người dùng

            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == email);

            if (user == null)
            {
                return null; // Trả về null nếu không tìm thấy thông tin người dùng
            }

            // Chuyển đổi thông tin người dùng thành đối tượng UserInfo
            var userInfo = new ApplicationUser
            {
                PasswordHash = user.PasswordHash,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Avatar = user.Avatar,
                //Thêm các thuộc tính khác từ đối tượng User
            };


            if (userInfo == null)
            {
                return NotFound(); // Trả về 404 nếu không tìm thấy thông tin người dùng
            }

            return Ok(userInfo); // Trả về thông tin người dùng nếu tìm thấy
        }

    }
}