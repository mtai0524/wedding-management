using CloudinaryDotNet.Actions;
using CloudinaryDotNet;
using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.ViewModels;
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
        [HttpPost("Update")]
        public async Task<IActionResult> UpdateProfile([FromBody] UserProfile profileData)
        {
            // Find the user by email or another unique identifier
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Email == profileData.Email);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Update the user's information
            user.FirstName = profileData.FirstName;
            user.LastName = profileData.LastName;
            user.Email = profileData.Email;
            user.PhoneNumber = profileData.PhoneNumber;

            // Khởi tạo Cloudinary
            Account account = new Account(
                "dl3hvap4a",
                "834354428788744",
                "lv7zI6VPru0YhHwUPQsru318SOE"
            );
            if (profileData.Avatar.Contains("https"))
            {
                user.Avatar = profileData.Avatar;
            }
            else
            {
                Cloudinary cloudinary = new Cloudinary(account);
                string imageFormat = "";
                if (profileData.Avatar.Contains("data:image/jpeg;base64,"))
                {
                    imageFormat = "data:image/jpeg;base64,";
                }
                else if (profileData.Avatar.Contains("data:image/png;base64,"))
                {
                    imageFormat = "data:image/png;base64,";
                }
                var base64Image = profileData.Avatar.Replace(imageFormat, "");

                // Giải mã chuỗi base64 thành mảng byte
                var imageBytes = Convert.FromBase64String(base64Image);

                // Tạo MemoryStream từ mảng byte
                var imageStream = new MemoryStream(imageBytes);

                // Tải lên hình ảnh lên Cloudinary
                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription("avatar", imageStream)
                };
                var uploadResult = cloudinary.Upload(uploadParams);

                // Lấy URL của hình ảnh từ kết quả tải lên
                user.Avatar = uploadResult.SecureUri.ToString();
            }
           


            // Save the changes to the database
            _context.ApplicationUser.Update(user);
            await _context.SaveChangesAsync();

            // Return the user's avatar URL or any other relevant information
            return Ok(new { avatar = user.Avatar });
        }

        [HttpGet("GetAvatar")]
        public async Task<IActionResult> GetAvatarAsync([FromQuery] string id)
        {
            // Find the user by email
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Id == id);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Return the user's avatar URL
            return Ok(new { avatar = user.Avatar });
        }

        [HttpGet("GetInFoUserById")]
        public async Task<IActionResult> GetInFoUserById([FromQuery] string id)
        {
            // Find the user by email
            var user = await _context.ApplicationUser.FirstOrDefaultAsync(u => u.Id == id);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Return the user's avatar URL
            return Ok(new { firstName = user.FirstName, lastName = user.LastName, email = user.Email, phone = user.PhoneNumber});
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
                Id = user.Id,
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