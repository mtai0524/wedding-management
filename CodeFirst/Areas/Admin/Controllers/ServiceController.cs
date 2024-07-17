using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Authorization;
using AspNetCoreHero.ToastNotification.Abstractions;
using CloudinaryDotNet;
using CodeFirst.Service;
using CodeFirst.Migrations;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ServiceController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly Cloudinary _cloudinary;
        private readonly INotyfService _noti;
        private readonly CloudinaryService _cloudianryService;


        public ServiceController(ApplicationDbContext context, Cloudinary cloudinary, INotyfService noti, CloudinaryService cloudinaryService)
        {
            _context = context;
            _cloudinary = cloudinary;
            _noti = noti;
            _cloudianryService = cloudinaryService;
        }

        // GET: Admin/Service
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.ServiceEntity.Include(s => s.ServiceCategory);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/Service/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ServiceEntity == null)
            {
                return NotFound();
            }

            var serviceEntity = await _context.ServiceEntity
                .Include(s => s.ServiceCategory)
                .FirstOrDefaultAsync(m => m.ServiceId == id);
            if (serviceEntity == null)
            {
                return NotFound();
            }

            return View(serviceEntity);
        }

        // GET: Admin/Service/Create
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.ServiceCategory, "CategoryId", "Name");
            return View();
        }

        // POST: Admin/Service/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ServiceId,Name,Price,Description,CategoryId")] ServiceEntity serviceEntity, IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
            {
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }
            if (ModelState.IsValid)
            {
                serviceEntity.Image = await _cloudianryService.UploadImageAsync(imageFile);
                _context.Add(serviceEntity);
                await _context.SaveChangesAsync();
                _noti.Success("Thêm dịch vụ thành công gòi nha!");
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.ServiceCategory, "CategoryId", "Name", serviceEntity.CategoryId);
            return View(serviceEntity);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Service/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ServiceEntity == null)
            {
                return NotFound();
            }

            var serviceEntity = await _context.ServiceEntity.FindAsync(id);
            if (serviceEntity == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.ServiceCategory, "CategoryId", "Name", serviceEntity.CategoryId);
            return View(serviceEntity);
        }

        // POST: Admin/Service/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ServiceId,Name,Price,Description,CategoryId")] ServiceEntity serviceEntity, IFormFile imageFile)
        {
            if (id != serviceEntity.ServiceId)
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
                    var existingMenuEntity = await _context.ServiceEntity.FindAsync(id);
                    if (existingMenuEntity != null)
                    {
                        // Sử dụng đường dẫn ảnh từ đối tượng hiện có
                        serviceEntity.Image = existingMenuEntity.Image;
                    }
                }
                try
                {
                    _noti.Success("Sửa chi nhánh thành công gòi nha!");
                    _context.Update(serviceEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ServiceEntityExists(serviceEntity.ServiceId))
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
                    serviceEntity.Image = await _cloudianryService.UploadImageAsync(imageFile);
                }

                try
                {
                    _noti.Success("Sửa chi nhánh thành công gòi nha!");
                    _context.Update(serviceEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ServiceEntityExists(serviceEntity.ServiceId))
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
            ViewData["CategoryId"] = new SelectList(_context.ServiceCategory, "CategoryId", "Name", serviceEntity.CategoryId);
            return View(serviceEntity);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Service/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ServiceEntity == null)
            {
                return NotFound();
            }

            var serviceEntity = await _context.ServiceEntity
                .Include(s => s.ServiceCategory)
                .FirstOrDefaultAsync(m => m.ServiceId == id);
            if (serviceEntity == null)
            {
                return NotFound();
            }

            return View(serviceEntity);
        }

        // POST: Admin/Service/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ServiceEntity == null)
            {
                return Problem("Entity set 'ApplicationDbContext.ServiceEntity'  is null.");
            }
            var serviceEntity = await _context.ServiceEntity.FindAsync(id);
            if (serviceEntity != null)
            {
                _context.ServiceEntity.Remove(serviceEntity);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ServiceEntityExists(int id)
        {
          return (_context.ServiceEntity?.Any(e => e.ServiceId == id)).GetValueOrDefault();
        }
    }
}
