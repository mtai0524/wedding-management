//using CodeFirst.Data;
//using CodeFirst.Models;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Identity;
//using System.Security.Claims;
//using System.Threading.Tasks;

//namespace CodeFirst.Service
//{
//    public class UserService
//    {
//        private readonly ApplicationDbContext _context;
//        private readonly UserManager<ApplicationUser> _userManager;
//        private readonly IHttpContextAccessor _httpContextAccessor;

//        public UserService(){
//        }
//        public UserService(ApplicationDbContext context,
//                           UserManager<ApplicationUser> userManager = null,
//                           IHttpContextAccessor httpContextAccessor = null)
//        {
//            _context = context;
//            _userManager = userManager;
//            _httpContextAccessor = httpContextAccessor;
//        }

//        private async Task<string> GetUsernameFromContext()
//        {
//            var user = _httpContextAccessor.HttpContext.User;

//            if (user.Identity.IsAuthenticated)
//            {
//                var userId = user.FindFirstValue(ClaimTypes.NameIdentifier); // Lấy ID người dùng từ Claim
//                if (userId != null)
//                {
//                    var appUser = await _userManager.FindByIdAsync(userId); // Tìm người dùng từ ID
//                    if (appUser != null)
//                    {
//                        return appUser.UserName; // Trả về tên người dùng
//                    }
//                }
//            }

//            return "Guest"; // Trả về "Guest" cho người dùng chưa xác thực
//        }
//    }
//}
