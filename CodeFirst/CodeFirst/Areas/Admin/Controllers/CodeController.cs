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
    public class CodeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CodeController(ApplicationDbContext context)
        {
            _context = context;
        }
        public void CheckAndRemoveExpiredCodes()
        {
            var currentDate = DateTime.Now;
            var expiredCodes = _context.Code.Where(code => code.ExpirationDate <= currentDate).ToList();

            foreach (var code in expiredCodes)
            {
                _context.Code.Remove(code);
            }
            _context.SaveChanges();
        }
        // GET: Admin/Code
        public async Task<IActionResult> Index()
        {
            //CheckAndRemoveExpiredCodes();
              return _context.Code != null ? 
                          View(await _context.Code.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.Code'  is null.");
        }

        // GET: Admin/Code/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Code == null)
            {
                return NotFound();
            }

            var code = await _context.Code
                .FirstOrDefaultAsync(m => m.CodeId == id);
            if (code == null)
            {
                return NotFound();
            }

            return View(code);
        }
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult Create()
        {
            return View();
        }
        [Authorize(Roles = "administrator system, admin")]
        // POST: Admin/Code/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CodeId,CodeString,Discount,Quantity,ExpirationDate")] Code code)
        {
            if (ModelState.IsValid)
            {
                _context.Add(code);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(code);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/Code/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Code == null)
            {
                return NotFound();
            }

            var code = await _context.Code.FindAsync(id);
            if (code == null)
            {
                return NotFound();
            }
            return View(code);
        }

        // POST: Admin/Code/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "administrator system, admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CodeId,CodeString,Discount,Quantity,ExpirationDate")] Code code)
        {
            if (id != code.CodeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(code);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CodeExists(code.CodeId))
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
            return View(code);
        }
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Code == null)
            {
                return NotFound();
            }

            var code = await _context.Code
                .FirstOrDefaultAsync(m => m.CodeId == id);
            if (code == null)
            {
                return NotFound();
            }

            return View(code);
        }
        [Authorize(Roles = "administrator system, admin")]
        // POST: Admin/Code/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Code == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Code'  is null.");
            }
            var code = await _context.Code.FindAsync(id);
            if (code != null)
            {
                _context.Code.Remove(code);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CodeExists(int id)
        {
          return (_context.Code?.Any(e => e.CodeId == id)).GetValueOrDefault();
        }
    }
}
