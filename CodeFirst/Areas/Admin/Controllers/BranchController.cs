using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using CodeFirst.Service;
using CloudinaryDotNet;
using Microsoft.AspNetCore.Authorization;
using CodeFirst.Models.Notifications;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BranchController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly Cloudinary _cloudinary;
        private readonly INotyfService _noti;
        private readonly CloudinaryService _cloudianryService;

        public BranchController(ApplicationDbContext context, Cloudinary cloudinary, INotyfService noti, CloudinaryService cloudinaryService)
        {
            _context = context;
            _cloudinary = cloudinary;
            _noti = noti;
            _cloudianryService = cloudinaryService;
        }

        [Authorize(Roles = "administrator system, admin")]

        [HttpPost]
        public IActionResult LockBranch(int branchId)
        {
            var branch = _context.Branch.Find(branchId);

            if (branch != null)
            {
                branch.IsLocked = true; // Tạm khóa chi nhánh
                _context.Entry(branch).State = EntityState.Modified;
                _context.SaveChanges();
            }

            return RedirectToAction("Index"); // Chuyển hướng đến trang danh sách chi nhánh
        }
        [Authorize(Roles = "administrator system, admin")]

        [HttpPost]
        public IActionResult UnlockBranch(int branchId)
        {
            var branch = _context.Branch.Find(branchId);

            if (branch != null)
            {
                branch.IsLocked = false; // Mở khóa chi nhánh
                _context.Entry(branch).State = EntityState.Modified;
                _context.SaveChanges();
            }

            return RedirectToAction("Index"); // Chuyển hướng đến trang danh sách chi nhánh
        }

        // GET: Admin/Branch
        public async Task<IActionResult> Index()
        {
              return _context.Branch != null ? 
                          View(await _context.Branch.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.Branch'  is null.");
        }

        // GET: Admin/Branch/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Branch == null)
            {
                return NotFound();
            }

            var branch = await _context.Branch
                .FirstOrDefaultAsync(m => m.BranchId == id);
            if (branch == null)
            {
                return NotFound();
            }

            return View(branch);
        }

        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Branch/Create
        public IActionResult Create()
        {
            return View();
        }
        [Authorize(Roles = "administrator system, admin")]

        // POST: Admin/Branch/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BranchId,Name,Description,Image, Address, Phone")] Branch branch, IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
            {
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }


            if (ModelState.IsValid)
            {
                branch.Image = await _cloudianryService.UploadImageAsync(imageFile);

                _context.Add(branch);
                await _context.SaveChangesAsync();
                _noti.Success("Thêm chi nhánh thành công gòi nha!");
                return RedirectToAction(nameof(Index));
            }
            return View(branch);
        }

        // GET: Admin/Branch/Edit/5
        [Authorize(Roles = "administrator system, admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Branch == null)
            {
                return NotFound();
            }

            var branch = await _context.Branch.FindAsync(id);
            if (branch == null)
            {
                return NotFound();
            }
            return View(branch);
        }


        [Authorize(Roles = "administrator system, admin")]

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BranchId,Name,Description,Image, Address, Phone")] Branch branch, IFormFile imageFile)
        {
            if (id != branch.BranchId)
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
                    var existingMenuEntity = await _context.Branch.FindAsync(id);
                    if (existingMenuEntity != null)
                    {
                        // Sử dụng đường dẫn ảnh từ đối tượng hiện có
                        branch.Image = existingMenuEntity.Image;
                    }
                }
                try
                {
                    _noti.Success("Sửa chi nhánh thành công gòi nha!");
                    _context.Update(branch);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BranchExists(branch.BranchId))
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
                    branch.Image = await _cloudianryService.UploadImageAsync(imageFile);
                }

                try
                {
                    _noti.Success("Sửa chi nhánh thành công gòi nha!");
                    _context.Update(branch);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BranchExists(branch.BranchId))
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
            return View(branch);
        }
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Branch == null)
            {
                return NotFound();
            }

            var branch = await _context.Branch
                .FirstOrDefaultAsync(m => m.BranchId == id);
            if (branch == null)
            {
                return NotFound();
            }

            return View(branch);
        }
        [Authorize(Roles = "administrator system, admin")]

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            if (_context.Branch == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Branch' is null.");
            }

            var branch = await _context.Branch.FindAsync(id);

            if (branch == null)
            {
                return NotFound();
            }

            // Lấy danh sách các bản ghi Feedback liên quan đến chi nhánh cần xóa
            var feedbacks = _context.Feedback.Where(f => f.BranchId == id);

            // Xóa các bản ghi Feedback
            _context.Feedback.RemoveRange(feedbacks);

            // Xóa chi nhánh
            _context.Branch.Remove(branch);

            await _context.SaveChangesAsync();
            _noti.Success("Xóa chi nhánh thành công!");

            return RedirectToAction(nameof(Index));
        }

        private bool BranchExists(int id)
        {
          return (_context.Branch?.Any(e => e.BranchId == id)).GetValueOrDefault();
        }
    }
}
