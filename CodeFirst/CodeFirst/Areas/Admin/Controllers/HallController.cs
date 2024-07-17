using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using AspNetCoreHero.ToastNotification.Abstractions;
using CloudinaryDotNet;
using CodeFirst.Service;
using CodeFirst.Migrations;
using Microsoft.AspNetCore.Authorization;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HallController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly Cloudinary _cloudinary;
        private readonly INotyfService _noti;
        private readonly CloudinaryService _cloudianryService;

        public HallController(ApplicationDbContext context, Cloudinary cloudinary, INotyfService noti, CloudinaryService cloudinaryService)
        {
            _context = context;
            _cloudinary = cloudinary;
            _noti = noti;
            _cloudianryService = cloudinaryService;
        }

        // GET: Admin/Hall
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Hall.Include(h => h.Branch);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/Hall/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Hall == null)
            {
                return NotFound();
            }

            var hall = await _context.Hall
                .Include(h => h.Branch)
                .FirstOrDefaultAsync(m => m.HallId == id);
            if (hall == null)
            {
                return NotFound();
            }

            return View(hall);
        }

        // GET: Admin/Hall/Create

        [Authorize(Roles = "administrator system, admin")]
        public IActionResult Create()
        {
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "Name");
            return View();
        }

        // POST: Admin/Hall/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HallId,Name,Description,Image,BranchId,Capacity,Price")] Hall hall, IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
            {
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }


            if (ModelState.IsValid)
            {
                hall.Image = await _cloudianryService.UploadImageAsync(imageFile);

                _context.Add(hall);
                await _context.SaveChangesAsync();
                _noti.Success("Thêm chi nhánh thành công gòi nha!");

                return RedirectToAction(nameof(Index));
            }
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", hall.BranchId);

            return View(hall);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Hall/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Hall == null)
            {
                return NotFound();
            }

            var hall = await _context.Hall.FindAsync(id);
            if (hall == null)
            {
                return NotFound();
            }
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "Name", hall.BranchId);
            return View(hall);
        }


        [Authorize(Roles = "administrator system, admin")]

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HallId,Name,Description,Image,BranchId,Capacity,Price")] Hall hall, IFormFile imageFile)
        {
            if (id != hall.HallId)
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
                    var existingMenuEntity = await _context.Hall.FindAsync(id);
                    if (existingMenuEntity != null)
                    {
                        // Sử dụng đường dẫn ảnh từ đối tượng hiện có
                        hall.Image = existingMenuEntity.Image;
                    }
                }
                try
                {
                    _noti.Success("Sửa sảnh cưới thành công gòi nha!");
                    _context.Update(hall);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HallExists(hall.HallId))
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
                    hall.Image = await _cloudianryService.UploadImageAsync(imageFile);
                }

                try
                {
                    _noti.Success("Sửa sảnh cưới thành công gòi nha!");
                    _context.Update(hall);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HallExists(hall.HallId))
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
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", hall.BranchId);
            return View(hall);
        }

        // GET: Admin/Hall/Delete/5
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Hall == null)
            {
                return NotFound();
            }

            var hall = await _context.Hall
                .Include(h => h.Branch)
                .FirstOrDefaultAsync(m => m.HallId == id);
            if (hall == null)
            {
                return NotFound();
            }

            return View(hall);
        }

        // POST: Admin/Hall/Delete/5
        [Authorize(Roles = "administrator system, admin")]

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Hall == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Hall'  is null.");
            }
            var hall = await _context.Hall.FindAsync(id);
            if (hall != null)
            {
                _context.Hall.Remove(hall);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HallExists(int id)
        {
          return (_context.Hall?.Any(e => e.HallId == id)).GetValueOrDefault();
        }
    }
}
