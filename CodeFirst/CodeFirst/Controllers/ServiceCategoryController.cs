using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;

namespace CodeFirst.Controllers
{
    public class ServiceCategoryController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ServiceCategoryController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: ServiceCategory
        public async Task<IActionResult> Index()
        {
              return _context.ServiceCategory != null ? 
                          View(await _context.ServiceCategory.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.ServiceCategory'  is null.");
        }

        // GET: ServiceCategory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ServiceCategory == null)
            {
                return NotFound();
            }

            var serviceCategory = await _context.ServiceCategory
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (serviceCategory == null)
            {
                return NotFound();
            }

            return View(serviceCategory);
        }

        // GET: ServiceCategory/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ServiceCategory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CategoryId,Name,Description")] ServiceCategory serviceCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(serviceCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(serviceCategory);
        }

        // GET: ServiceCategory/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ServiceCategory == null)
            {
                return NotFound();
            }

            var serviceCategory = await _context.ServiceCategory.FindAsync(id);
            if (serviceCategory == null)
            {
                return NotFound();
            }
            return View(serviceCategory);
        }

        // POST: ServiceCategory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CategoryId,Name,Description")] ServiceCategory serviceCategory)
        {
            if (id != serviceCategory.CategoryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(serviceCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ServiceCategoryExists(serviceCategory.CategoryId))
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
            return View(serviceCategory);
        }

        // GET: ServiceCategory/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ServiceCategory == null)
            {
                return NotFound();
            }

            var serviceCategory = await _context.ServiceCategory
                .FirstOrDefaultAsync(m => m.CategoryId == id);
            if (serviceCategory == null)
            {
                return NotFound();
            }

            return View(serviceCategory);
        }

        // POST: ServiceCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ServiceCategory == null)
            {
                return Problem("Entity set 'ApplicationDbContext.ServiceCategory'  is null.");
            }
            var serviceCategory = await _context.ServiceCategory.FindAsync(id);
            if (serviceCategory != null)
            {
                _context.ServiceCategory.Remove(serviceCategory);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ServiceCategoryExists(int id)
        {
          return (_context.ServiceCategory?.Any(e => e.CategoryId == id)).GetValueOrDefault();
        }
    }
}
