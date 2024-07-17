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

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class MenuCategoryController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MenuCategoryController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Admin/MenuCategory
        public async Task<IActionResult> Index()
        {
              return _context.MenuCategory != null ? 
                          View(await _context.MenuCategory.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.MenuCategory'  is null.");
        }

        // GET: Admin/MenuCategory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.MenuCategory == null)
            {
                return NotFound();
            }

            var menuCategory = await _context.MenuCategory
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (menuCategory == null)
            {
                return NotFound();
            }

            return View(menuCategory);
        }

        // GET: Admin/MenuCategory/Create
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/MenuCategory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CategoryId,Name,Description")] MenuCategory menuCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(menuCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(menuCategory);
        }

        // GET: Admin/MenuCategory/Edit/5
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.MenuCategory == null)
            {
                return NotFound();
            }

            var menuCategory = await _context.MenuCategory.FindAsync(id);
            if (menuCategory == null)
            {
                return NotFound();
            }
            return View(menuCategory);
        }

        // POST: Admin/MenuCategory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CategoryId,Name,Description")] MenuCategory menuCategory)
        {
            if (id != menuCategory.CategoryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(menuCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MenuCategoryExists(menuCategory.CategoryId))
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
            return View(menuCategory);
        }

        // GET: Admin/MenuCategory/Delete/5
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.MenuCategory == null)
            {
                return NotFound();
            }

            var menuCategory = await _context.MenuCategory
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (menuCategory == null)
            {
                return NotFound();
            }

            return View(menuCategory);
        }

        // POST: Admin/MenuCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.MenuCategory == null)
            {
                return Problem("Entity set 'ApplicationDbContext.MenuCategory'  is null.");
            }
            var menuCategory = await _context.MenuCategory.FindAsync(id);
            if (menuCategory != null)
            {
                _context.MenuCategory.Remove(menuCategory);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MenuCategoryExists(int id)
        {
          return (_context.MenuCategory?.Any(e => e.CategoryId == id)).GetValueOrDefault();
        }
    }
}
