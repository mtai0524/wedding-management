using Microsoft.AspNetCore.Mvc;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using WeddingRestaurant.Models;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.SignalR;

namespace WeddingRestaurant.Controllers
{
    public class UserController : Controller
    {
        private readonly Cloudinary _cloudinary;
        private readonly IHubContext<MyHub> _hubContext;

        RestaurantContext db = new RestaurantContext();
        public UserController(IHubContext<MyHub> hubContext, Cloudinary cloudinary)
        {
            _cloudinary = cloudinary;
            _hubContext = hubContext;

        }
        public IActionResult Index()
        {
			//var listUser = db.Users.ToList();
			var listUser = new User();
			return View(listUser);
        }

        [HttpPost]
        public async Task<IActionResult> UploadAsync(IFormFile imageFile, User user)
        {
            if (imageFile != null && imageFile.Length > 0)
            {
                using (var stream = imageFile.OpenReadStream())
                {
                    var uploadParams = new ImageUploadParams
                    {
                        File = new FileDescription(imageFile.FileName, stream)
                    };

                    var uploadResult = _cloudinary.Upload(uploadParams);

                    // Lấy đường dẫn của hình ảnh sau khi upload
                    var imageUrl = uploadResult.SecureUrl.AbsoluteUri;

                    // Lưu đường dẫn hình ảnh vào cơ sở dữ liệu

                    var username = HttpContext.Request.Form["username"];
					var password = HttpContext.Request.Form["password"];

					// Tạo đối tượng User mới
					var newUser = new User
					{
						Name = username,
						Password = password,
                        Role = "user",
						Avatar = imageUrl
					};


					// Thêm đối tượng User vào cơ sở dữ liệu
					db.Users.Add(newUser);
					db.SaveChanges();
                    TempData["SuccessMessage"] = "Tạo tài khoản thành công! Đăng nhập để bắt đầu sử dụng.";
                    //// Gán giá trị cho ViewBag.Success
                    //ViewBag.Success = true;
                    //await _hubContext.Clients.All.SendAsync("ReceiveMessage", "Admin", "Tạo tài khoản thành công! Đăng nhập để bắt đầu sử dụng.");
                    // Tải lại trang Index để hiển thị danh sách cùng với hình ảnh vừa tải lên
                    return View("Login", newUser);
                }
            }

            return View("Index", db.Users.ToList());
        }
        [HttpPost]
        public IActionResult Login(User user)
        {
            var username = HttpContext.Request.Form["username"].ToString();
            var password = HttpContext.Request.Form["password"].ToString();

            // Kiểm tra xem người dùng có tồn tại trong cơ sở dữ liệu không
            var foundUser = db.Users.FirstOrDefault(u => u.Name == username && u.Password == password);

            if (foundUser != null)
            {

                TempData["SuccessMessage"] = "Đăng nhập thành công!";
            }
            else
            {
                TempData["ErrorMessage"] = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }

            return RedirectToAction("Login"); // Chuyển hướng đến trang đăng nhập với thông báo
        }

    }
}
