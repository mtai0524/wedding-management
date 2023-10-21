using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class TestHallController : Controller
    {
        private readonly ApplicationDbContext _context;

        public TestHallController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Admin/TestHall
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Hall.Include(h => h.Branch);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/TestHall/Details/5
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

        // GET: Admin/TestHall/Create
        public IActionResult Create()
        {
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId");
            return View();
        }

        // POST: Admin/TestHall/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HallId,Name,Description,Image,BranchId,Capacity,Price")] Hall hall)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hall);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", hall.BranchId);
            return View(hall);
        }

        // GET: Admin/TestHall/Edit/5
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
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", hall.BranchId);
            return View(hall);
        }

        // POST: Admin/TestHall/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HallId,Name,Description,Image,BranchId,Capacity,Price")] Hall hall)
        {
            if (id != hall.HallId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
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

        // GET: Admin/TestHall/Delete/5
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

        // POST: Admin/TestHall/Delete/5
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
