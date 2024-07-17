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
    public class ComboMenuEntityController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ComboMenuEntityController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Admin/ComboMenuEntity
        public async Task<IActionResult> Index()
        {
              return _context.ComboMenuEntity != null ? 
                          View(await _context.ComboMenuEntity.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.ComboMenuEntity'  is null.");
        }

        // GET: Admin/ComboMenuEntity/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ComboMenuEntity == null)
            {
                return NotFound();
            }

            var comboMenuEntity = await _context.ComboMenuEntity
                .FirstOrDefaultAsync(m => m.ComboMenuId == id);
            if (comboMenuEntity == null)
            {
                return NotFound();
            }

            return View(comboMenuEntity);
        }

        // GET: Admin/ComboMenuEntity/Create
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/ComboMenuEntity/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ComboMenuId,Name,ComboPrice")] ComboMenuEntity comboMenuEntity)
        {
            if (ModelState.IsValid)
            {
                _context.Add(comboMenuEntity);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(comboMenuEntity);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/ComboMenuEntity/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ComboMenuEntity == null)
            {
                return NotFound();
            }

            var comboMenuEntity = await _context.ComboMenuEntity.FindAsync(id);
            if (comboMenuEntity == null)
            {
                return NotFound();
            }
            return View(comboMenuEntity);
        }

        // POST: Admin/ComboMenuEntity/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Edit(int id, [Bind("ComboMenuId,Name,ComboPrice")] ComboMenuEntity comboMenuEntity)
        {
            if (id != comboMenuEntity.ComboMenuId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(comboMenuEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ComboMenuEntityExists(comboMenuEntity.ComboMenuId))
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
            return View(comboMenuEntity);
        }

        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/ComboMenuEntity/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ComboMenuEntity == null)
            {
                return NotFound();
            }

            var comboMenuEntity = await _context.ComboMenuEntity
                .FirstOrDefaultAsync(m => m.ComboMenuId == id);
            if (comboMenuEntity == null)
            {
                return NotFound();
            }

            return View(comboMenuEntity);
        }

        // POST: Admin/ComboMenuEntity/Delete/5
        [Authorize(Roles = "administrator system, admin")]

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ComboMenuEntity == null)
            {
                return Problem("Entity set 'ApplicationDbContext.ComboMenuEntity'  is null.");
            }
            var comboMenuEntity = await _context.ComboMenuEntity.FindAsync(id);
            if (comboMenuEntity != null)
            {
                _context.ComboMenuEntity.Remove(comboMenuEntity);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ComboMenuEntityExists(int id)
        {
          return (_context.ComboMenuEntity?.Any(e => e.ComboMenuId == id)).GetValueOrDefault();
        }
    }
}
