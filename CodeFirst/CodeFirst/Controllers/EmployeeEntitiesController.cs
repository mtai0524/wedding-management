using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Authorization;

namespace CodeFirst.Controllers
{
    [Authorize(Roles = "administrator system ,admin, employee")]
    public class EmployeeEntitiesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public EmployeeEntitiesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: EmployeeEntities
        public async Task<IActionResult> Index()
        {
              return _context.Employee != null ? 
                          View(await _context.Employee.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.Employee'  is null.");
        }

        // GET: EmployeeEntities/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Employee == null)
            {
                return NotFound();
            }

            var employeeEntity = await _context.Employee
                .FirstOrDefaultAsync(m => m.Id == id);
            if (employeeEntity == null)
            {
                return NotFound();
            }

            return View(employeeEntity);
        }

        // GET: EmployeeEntities/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: EmployeeEntities/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FirstName,LastName,Mobile,Email")] EmployeeEntity employeeEntity)
        {
            if (ModelState.IsValid)
            {
                _context.Add(employeeEntity);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(employeeEntity);
        }

        // GET: EmployeeEntities/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Employee == null)
            {
                return NotFound();
            }

            var employeeEntity = await _context.Employee.FindAsync(id);
            if (employeeEntity == null)
            {
                return NotFound();
            }
            return View(employeeEntity);
        }

        // POST: EmployeeEntities/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FirstName,LastName,Mobile,Email")] EmployeeEntity employeeEntity)
        {
            if (id != employeeEntity.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(employeeEntity);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmployeeEntityExists(employeeEntity.Id))
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
            return View(employeeEntity);
        }
        [Authorize(Roles = "administrator system")]
        // GET: EmployeeEntities/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Employee == null)
            {
                return NotFound();
            }

            var employeeEntity = await _context.Employee
                .FirstOrDefaultAsync(m => m.Id == id);
            if (employeeEntity == null)
            {
                return NotFound();
            }

            return View(employeeEntity);
        }

        // POST: EmployeeEntities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Employee == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Employee'  is null.");
            }
            var employeeEntity = await _context.Employee.FindAsync(id);
            if (employeeEntity != null)
            {
                _context.Employee.Remove(employeeEntity);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EmployeeEntityExists(int id)
        {
          return (_context.Employee?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
