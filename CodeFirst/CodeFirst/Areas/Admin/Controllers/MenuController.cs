﻿using System;
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

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class MenuController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly Cloudinary _cloudinary;

        public MenuController(ApplicationDbContext context, Cloudinary cloudinary)
        {
            _context = context;
            _cloudinary = cloudinary;
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

        public async Task<IActionResult> Index(int? categoryId, string searchString)
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

            return View(menuItems.ToList());
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MenuId,Name,Price,Description,CategoryId")] MenuEntity menuEntity, IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
            {
                // Nếu không có hình ảnh được tải lên, bạn có thể thực hiện xử lý phù hợp ở đây
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }

            if (ModelState.IsValid)
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

                        // Lấy đường dẫn của hình ảnh sau khi upload và lưu vào thuộc tính ImageUrl
                        menuEntity.Image = uploadResult.SecureUrl.AbsoluteUri;
                    }
                }
                _context.Add(menuEntity);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.MenuCategory, "CategoryId", "Name", menuEntity.CategoryId);
            return View(menuEntity);
        }

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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MenuId,Name,Price,Description,CategoryId")] MenuEntity menuEntity, IFormFile imageFile)
        {
            if (id != menuEntity.MenuId)
            {
                return NotFound();
            }
            if (imageFile == null || imageFile.Length == 0)
            {
                // Nếu không có hình ảnh được tải lên, bạn có thể thực hiện xử lý phù hợp ở đây
                ModelState.AddModelError("ImageFile", "Vui lòng chọn một hình ảnh.");
            }

            if (ModelState.IsValid)
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

                        // Lấy đường dẫn của hình ảnh sau khi upload và lưu vào thuộc tính ImageUrl
                        menuEntity.Image = uploadResult.SecureUrl.AbsoluteUri;
                    }
                }
                try
                {
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

        // GET: Admin/Menu/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

        // POST: Admin/Menu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.MenuEntity == null)
            {
                return Problem("Entity set 'ApplicationDbContext.MenuEntity'  is null.");
            }
            var menuEntity = await _context.MenuEntity.FindAsync(id);
            if (menuEntity != null)
            {
                _context.MenuEntity.Remove(menuEntity);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MenuEntityExists(int id)
        {
          return (_context.MenuEntity?.Any(e => e.MenuId == id)).GetValueOrDefault();
        }
    }
}
