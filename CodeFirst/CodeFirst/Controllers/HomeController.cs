using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CodeFirst.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public HomeController(ILogger<HomeController> logger, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _logger = logger;
            this._userManager = userManager;
            this._roleManager = roleManager;
        }
        public IActionResult Index()
        {
            // Lấy danh sách tất cả người dùng và danh sách vai trò
            var users = _userManager.Users.ToList();
            var roles = _roleManager.Roles.ToList();

            // Tạo một danh sách kết hợp giữa người dùng và vai trò
            var userRoles = new List<Tuple<ApplicationUser, IList<string>>>();

            foreach (var user in users)
            {
                var userRoleNames = _userManager.GetRolesAsync(user).Result;
                userRoles.Add(new Tuple<ApplicationUser, IList<string>>(user, userRoleNames));
            }

            // Truyền danh sách kết hợp vào view
            ViewData["UserRoles"] = userRoles;

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> EditUser(string id)
        {
            var user = await _userManager.FindByIdAsync(id);
            if(user == null)
            {
                ViewBag.ErrorMsg = $"User with id = {id} cannot by found";
                return View("NotFound");
            }
            var userViewModel = new UserViewModel
            {
                Id = user.Id,
                UserName = user.UserName,
                // Thêm các thuộc tính khác của người dùng vào đây
            };
            return View("EditUser", userViewModel);
        }
        [HttpPost]
        public async Task<IActionResult> EditUser(UserViewModel model)
        {
            if (ModelState.IsValid)
            {
        // Kiểm tra model state để đảm bảo dữ liệu hợp lệ

        // Tìm người dùng cần chỉnh sửa
        var user = await _userManager.FindByIdAsync(model.Id);
        //if (user == null)
        //{
        //    ViewBag.ErrorMsg = $"User with id = {model.Id} cannot by found";
        //    return View("NotFound");
        //}

        // Cập nhật thông tin người dùng dựa trên model
        user.UserName = model.UserName;
        // Cập nhật các thông tin người dùng khác ở đây

        // Lưu thay đổi vào cơ sở dữ liệu
        var result = await _userManager.UpdateAsync(user);

        if (result.Succeeded)
        {
            // Lưu thành công, chuyển hướng đến trang chi tiết người dùng hoặc trang khác
            return RedirectToAction("Index", new { id = user.Id });
        }
        else
        {
            // Xử lý lỗi khi cập nhật không thành công
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
        }
    }

    // Nếu ModelState không hợp lệ, hiển thị lại form với thông báo lỗi
    return View("EditUser", model);
}

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}