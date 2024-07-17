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
    public class TimeOfDaysController : Controller
    {
        private readonly ApplicationDbContext _context;

        public TimeOfDaysController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: TimeOfDays
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.TimeOfDay.Include(t => t.Hall);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: TimeOfDays/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TimeOfDay == null)
            {
                return NotFound();
            }

            var timeOfDay = await _context.TimeOfDay
                .Include(t => t.Hall)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (timeOfDay == null)
            {
                return NotFound();
            }

            return View(timeOfDay);
        }

        // GET: TimeOfDays/Create
        public IActionResult Create()
        {
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId");
            return View();
        }

        // POST: TimeOfDays/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,HallId,Morning,Afternoon,Dinner")] TimeOfDay timeOfDay)
        {
            if (ModelState.IsValid)
            {
                _context.Add(timeOfDay);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", timeOfDay.HallId);
            return View(timeOfDay);
        }

        // GET: TimeOfDays/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.TimeOfDay == null)
            {
                return NotFound();
            }

            var timeOfDay = await _context.TimeOfDay.FindAsync(id);
            if (timeOfDay == null)
            {
                return NotFound();
            }
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", timeOfDay.HallId);
            return View(timeOfDay);
        }

        // POST: TimeOfDays/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,HallId,Morning,Afternoon,Dinner")] TimeOfDay timeOfDay)
        {
            if (id != timeOfDay.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(timeOfDay);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TimeOfDayExists(timeOfDay.Id))
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
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", timeOfDay.HallId);
            return View(timeOfDay);
        }

        // GET: TimeOfDays/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.TimeOfDay == null)
            {
                return NotFound();
            }

            var timeOfDay = await _context.TimeOfDay
                .Include(t => t.Hall)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (timeOfDay == null)
            {
                return NotFound();
            }

            return View(timeOfDay);
        }

        // POST: TimeOfDays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.TimeOfDay == null)
            {
                return Problem("Entity set 'ApplicationDbContext.TimeOfDay'  is null.");
            }
            var timeOfDay = await _context.TimeOfDay.FindAsync(id);
            if (timeOfDay != null)
            {
                _context.TimeOfDay.Remove(timeOfDay);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TimeOfDayExists(int id)
        {
          return (_context.TimeOfDay?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
