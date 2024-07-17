using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using System.Globalization;
using System.Text;
using CloudinaryDotNet.Actions;
using CloudinaryDotNet;
using AspNetCoreHero.ToastNotification.Abstractions;
using CodeFirst.Service;
using CodeFirst.Models;
using Microsoft.AspNetCore.Authorization;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class MenuController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly Cloudinary _cloudinary;
        private readonly INotyfService _noti;
        private readonly CloudinaryService _cloudianryService;

        public MenuController(ApplicationDbContext context, Cloudinary cloudinary, INotyfService noti, CloudinaryService cloudinaryService)
        {
            _context = context;
            _cloudinary = cloudinary;
            _noti = noti;
            _cloudianryService = cloudinaryService;
        }

        // Hàm loại bỏ dấu tiếng Việt
        private string RemoveDiacritics(string text)
        {
            string normalizedString = text.Normalize(NormalizationForm.FormD);
            StringBuilder stringBuilder = new StringBuilder();

            foreach (char c in normalizedString)
            {
                UnicodeCategory unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }

        // GET: Admin/Menu

        public async Task<IActionResult> Index(int page = 1)
        {
            // Lấy toàn bộ danh sách menu
            var menuItems = _context.MenuEntity.Include(m => m.MenuCategory);

            // Lấy danh sách thể loại để hiển thị trong dropdown
            ViewBag.Categories = _context.MenuCategory.ToList();

            // số item trong 1 page
            int pageSize = 4;

            // Thực hiện phân trang
            var paginatedMenuItems = await menuItems.Skip((page - 1) * pageSize)
                                                    .Take(pageSize)
                                                    .ToListAsync();
            int totalItems = menuItems.Count();
            int totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);

            var model = new PaginatedList<MenuEntity>
            {
                Items = paginatedMenuItems,
                PageIndex = page,
                TotalItems = totalItems,
                PageSize = pageSize,
                TotalPages = totalPages // Thêm TotalPages vào model
            };
          

            return View(model);
        }
        public async Task<IActionResult> Filter(int? categoryId, string searchString)
        {
            IEnumerable<MenuEntity> menuItems = _context.MenuEntity.Include(m => m.MenuCategory);

            if (categoryId.HasValue)
            {
                // Lọc theo categoryId nếu có
                menuItems = menuItems.Where(m => m.CategoryId == categoryId);
            }

            if (!string.IsNullOrEmpty(searchString))
            {
                // Loại bỏ dấu tiếng Việt trong chuỗi tìm kiếm
                string searchQuery = RemoveDiacritics(searchString);

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    // Lấy toàn bộ danh sách sản phẩm từ cơ sở dữ liệu
                    var allProducts = menuItems.ToList();

                    // Thực hiện tìm kiếm trên danh sách đã lấy từ cơ sở dữ liệu
                    menuItems = allProducts.Where(p => RemoveDiacritics(p.Name).Contains(searchQuery));
                }
            }

            // Lấy danh sách thể loại để hiển thị trong dropdown
            ViewBag.Categories = await _context.MenuCategory.ToListAsync();

            return PartialView("_MenuPartialView", menuItems.ToList());
        }

        // GET: Admin/Menu/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.MenuEntity == null)
            {
                return NotFound();
            }

            var menuEntity = await _context.MenuEntity
                .Include(m => m.MenuCategory)
                .FirstOrDefaultAsync(m => m.MenuId == id);
            if (menuEntity == null)
            {
                return NotFound();
            }

            return View(menuEntity);
        }

        // GET: Admin/Menu/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name");
            return View();
        }

        // POST: Admin/Menu/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "administrator system, admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MenuId,Name,Price,Description,CategoryId")] MenuEntity menuEntity, IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
            {
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }

            if (ModelState.IsValid)
            {
                menuEntity.Image = await _cloudianryService.UploadImageAsync(imageFile);
                _context.Add(menuEntity);
                await _context.SaveChangesAsync();
                _noti.Success("Thêm món ăn thành công gòi nha!");
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name", menuEntity.CategoryId);
            return View(menuEntity);

        }

        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Menu/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.MenuEntity == null)
            {
                return NotFound();
            }

            var menuEntity = await _context.MenuEntity.FindAsync(id);
            if (menuEntity == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name", menuEntity.CategoryId);
            return View(menuEntity);
        }

        // POST: Admin/Menu/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpGet]
        public IActionResult GetMenuList()
        {
            var menus = _context.MenuEntity.Include(m => m.MenuCategory).ToList();
            return PartialView("_MenuListPartial", menus); // Trả về một partial view chứa danh sách món ăn
        }
        [HttpGet]
        public IActionResult GetMenuForEdit(int id)
        {
            var menuEntity = _context.MenuEntity.Find(id);
            if (menuEntity == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name", menuEntity.CategoryId);

            return PartialView("_MenuPartial", menuEntity);
        }
        public IActionResult GetMenuForCreate()
        {
            // Tạo một đối tượng MenuEntity mới để làm mẫu cho form thêm menu
            MenuEntity newMenu = new MenuEntity();
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name");

            // Truyền đối tượng newMenu vào view để hiển thị form thêm menu
            return PartialView("_CreateMenuPartialView", newMenu);
        }
        [HttpPost]
        public IActionResult EditMenu([FromBody] MenuEntity editedMenu)
        {
            if (editedMenu == null)
            {
                return BadRequest("Invalid data");
            }

            // Tìm menu theo ID trong cơ sở dữ liệu
            var menuInDatabase = _context.MenuEntity.FirstOrDefault(m => m.MenuId == editedMenu.MenuId);

            if (menuInDatabase == null)
            {
                return NotFound("Menu not found");
            }

            // Cập nhật các thuộc tính của menu từ dữ liệu chỉnh sửa
            menuInDatabase.Name = editedMenu.Name;
            menuInDatabase.Price = editedMenu.Price;
            menuInDatabase.Description = editedMenu.Description;
            menuInDatabase.CategoryId = editedMenu.CategoryId;

            // Lưu thay đổi vào cơ sở dữ liệu
            _context.SaveChanges();

            return Ok("Menu updated successfully");
        }
        [Authorize(Roles = "administrator system, admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MenuId,Name,Price,Description,CategoryId")] MenuEntity menuEntity, IFormFile imageFile)
        {
            if (id != menuEntity.MenuId)
            {
                return NotFound();
            }

            // Kiểm tra xem người dùng có chọn ảnh mới hay không
            bool isImageChanged = imageFile != null && imageFile.Length > 0;


            if (!ModelState.IsValid)
            {
                if (!isImageChanged)
                {
                    // Nếu người dùng không chọn ảnh mới, tìm đối tượng MenuEntity hiện có từ cơ sở dữ liệu
                    var existingMenuEntity = await _context.MenuEntity.FindAsync(id);
                    if (existingMenuEntity != null)
                    {
                        // Sử dụng đường dẫn ảnh từ đối tượng hiện có
                        menuEntity.Image = existingMenuEntity.Image;
                    }
                }
                try
                {
                    _noti.Success("Sửa món ăn thành công gòi nha!");
                    _context.Update(menuEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MenuEntityExists(menuEntity.MenuId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            if (ModelState.IsValid)
            {
                if (isImageChanged)
                {
                    // Nếu người dùng đã chọn ảnh mới, xử lý việc tải lên và cập nhật đường dẫn hình
                    menuEntity.Image = await _cloudianryService.UploadImageAsync(imageFile);
                }

                try
                {
                    _noti.Success("Sửa món ăn thành công gòi nha!");
                    _context.Update(menuEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MenuEntityExists(menuEntity.MenuId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "CategoryId", menuEntity.CategoryId);
            return View(menuEntity);
        }

        // Action để xóa món ăn bằng Ajax
        [Authorize(Roles = "administrator system, admin")]
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var menu = await _context.MenuEntity.FindAsync(id);
                if (menu == null)
                {
                    return Json(new { success = false }); // Trả về JSON để xử lý lỗi
                }
                // Lấy danh sách các bản ghi OrderMenu liên quan đến món ăn
                var orderMenus = _context.OrderMenu.Where(om => om.MenuId == id);

                // Xóa các bản ghi OrderMenu
                _context.OrderMenu.RemoveRange(orderMenus);

                _noti.Success("Xóa món ăn thành công gòi á!!");
                _context.MenuEntity.Remove(menu);
                await _context.SaveChangesAsync();
                return Json(new { success = true }); // Trả về JSON để xử lý thành công
            }
            catch (Exception ex)
            {
                _noti.Success("Xoa that bai!!");

                // Xử lý khi có lỗi
                return Json(new { success = false, error = ex.Message });
            }
        }

        public IActionResult GetMenuDetails(int id)
        {
            var menuEntity = _context.MenuEntity
                .Include(m => m.MenuCategory)
                .FirstOrDefault(m => m.MenuId == id);

            if (menuEntity == null)
            {
                return NotFound();
            }

            return PartialView("_MenuDetailsPartial", menuEntity);
        }

        private bool MenuEntityExists(int id)
        {
            return (_context.MenuEntity?.Any(e => e.MenuId == id)).GetValueOrDefault();
        }
    }
}
