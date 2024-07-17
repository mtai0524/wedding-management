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
    public class InvoiceCodeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public InvoiceCodeController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Admin/InvoiceCode
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.InvoiceCode.Include(i => i.Code).Include(i => i.Invoice);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/InvoiceCode/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.InvoiceCode == null)
            {
                return NotFound();
            }

            var invoiceCode = await _context.InvoiceCode
                .Include(i => i.Code)
                .Include(i => i.Invoice)
                .FirstOrDefaultAsync(m => m.InvoiceCodeId == id);
            if (invoiceCode == null)
            {
                return NotFound();
            }

            return View(invoiceCode);
        }

        // GET: Admin/InvoiceCode/Create
        public IActionResult Create()
        {
            ViewData["CodeId"] = new SelectList(_context.Code, "CodeId", "CodeId");
            ViewData["InvoiceId"] = new SelectList(_context.Invoice, "InvoiceID", "InvoiceID");
            return View();
        }

        // POST: Admin/InvoiceCode/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("InvoiceCodeId,InvoiceId,CodeId")] InvoiceCode invoiceCode)
        {
            if (ModelState.IsValid)
            {
                _context.Add(invoiceCode);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CodeId"] = new SelectList(_context.Code, "CodeId", "CodeId", invoiceCode.CodeId);
            ViewData["InvoiceId"] = new SelectList(_context.Invoice, "InvoiceID", "InvoiceID", invoiceCode.InvoiceId);
            return View(invoiceCode);
        }

        // GET: Admin/InvoiceCode/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.InvoiceCode == null)
            {
                return NotFound();
            }

            var invoiceCode = await _context.InvoiceCode.FindAsync(id);
            if (invoiceCode == null)
            {
                return NotFound();
            }
            ViewData["CodeId"] = new SelectList(_context.Code, "CodeId", "CodeId", invoiceCode.CodeId);
            ViewData["InvoiceId"] = new SelectList(_context.Invoice, "InvoiceID", "InvoiceID", invoiceCode.InvoiceId);
            return View(invoiceCode);
        }

        // POST: Admin/InvoiceCode/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("InvoiceCodeId,InvoiceId,CodeId")] InvoiceCode invoiceCode)
        {
            if (id != invoiceCode.InvoiceCodeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(invoiceCode);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InvoiceCodeExists(invoiceCode.InvoiceCodeId))
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
            ViewData["CodeId"] = new SelectList(_context.Code, "CodeId", "CodeId", invoiceCode.CodeId);
            ViewData["InvoiceId"] = new SelectList(_context.Invoice, "InvoiceID", "InvoiceID", invoiceCode.InvoiceId);
            return View(invoiceCode);
        }

        // GET: Admin/InvoiceCode/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.InvoiceCode == null)
            {
                return NotFound();
            }

            var invoiceCode = await _context.InvoiceCode
                .Include(i => i.Code)
                .Include(i => i.Invoice)
                .FirstOrDefaultAsync(m => m.InvoiceCodeId == id);
            if (invoiceCode == null)
            {
                return NotFound();
            }

            return View(invoiceCode);
        }

        // POST: Admin/InvoiceCode/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.InvoiceCode == null)
            {
                return Problem("Entity set 'ApplicationDbContext.InvoiceCode'  is null.");
            }
            var invoiceCode = await _context.InvoiceCode.FindAsync(id);
            if (invoiceCode != null)
            {
                _context.InvoiceCode.Remove(invoiceCode);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InvoiceCodeExists(int id)
        {
          return (_context.InvoiceCode?.Any(e => e.InvoiceCodeId == id)).GetValueOrDefault();
        }
    }
}
