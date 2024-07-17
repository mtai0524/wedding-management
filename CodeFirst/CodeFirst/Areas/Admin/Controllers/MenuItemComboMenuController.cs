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
    public class MenuItemComboMenuController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MenuItemComboMenuController(ApplicationDbContext context)
        {
            _context = context;
        }
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult AddMenuToCombo()
        {
            var comboMenus = _context.ComboMenuEntity.ToList();
            var menus = _context.MenuEntity.ToList();

            ViewBag.ComboMenus = new SelectList(comboMenus, "ComboMenuId", "Name");
            ViewBag.Menus = new MultiSelectList(menus, "MenuId", "Name");

            // Tạo ViewModel và gán giá trị mặc định (nếu cần)
            var viewModel = new AddMenuToComboViewModel
            {
                ComboMenuId = 0, // Giá trị ComboMenuId mặc định
                SelectedMenuIds = new List<int>() // Danh sách MenuIds mặc định
            };

            return View(viewModel);
        }

        [HttpPost]
        public IActionResult AddMenuToCombo(int comboMenuId, List<int> selectedMenuIds)
        {
            if (selectedMenuIds != null)
            {
                foreach (var menuId in selectedMenuIds)
                {
                    var menuItemComboMenu = new MenuItemComboMenu
                    {
                        ComboMenuId = comboMenuId,
                        MenuId = menuId
                    };

                    // Thêm dòng mới vào DbSet và lưu vào cơ sở dữ liệu
                    _context.MenuItemComboMenu.Add(menuItemComboMenu);
                }

                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }



        // GET: Admin/MenuItemComboMenu
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.MenuItemComboMenu.Include(m => m.ComboMenuEntity).Include(m => m.MenuEntity);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/MenuItemComboMenu/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.MenuItemComboMenu == null)
            {
                return NotFound();
            }

            var menuItemComboMenu = await _context.MenuItemComboMenu
                .Include(m => m.ComboMenuEntity)
                .Include(m => m.MenuEntity)
                .FirstOrDefaultAsync(m => m.MenuItemComboMenuId == id);
            if (menuItemComboMenu == null)
            {
                return NotFound();
            }

            return View(menuItemComboMenu);
        }

        // GET: Admin/MenuItemComboMenu/Create
        [Authorize(Roles = "administrator system, admin")]

        public IActionResult Create()
        {
            ViewData["ComboMenuId"] = new SelectList(_context.ComboMenuEntity, "ComboMenuId", "Name");
            ViewData["MenuId"] = new SelectList(_context.MenuEntity, "MenuId", "Name");
            return View();
        }

        // POST: Admin/MenuItemComboMenu/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MenuItemComboMenuId,MenuId,ComboMenuId")] MenuItemComboMenu menuItemComboMenu)
        {
            if (ModelState.IsValid)
            {
                _context.Add(menuItemComboMenu);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ComboMenuId"] = new SelectList(_context.ComboMenuEntity, "ComboMenuId", "Name", menuItemComboMenu.ComboMenuId);
            ViewData["MenuId"] = new SelectList(_context.MenuEntity, "MenuId", "Name", menuItemComboMenu.MenuId);
            return View(menuItemComboMenu);
        }

        // GET: Admin/MenuItemComboMenu/Edit/5
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.MenuItemComboMenu == null)
            {
                return NotFound();
            }

            var menuItemComboMenu = await _context.MenuItemComboMenu.FindAsync(id);
            if (menuItemComboMenu == null)
            {
                return NotFound();
            }
            ViewData["ComboMenuId"] = new SelectList(_context.ComboMenuEntity, "ComboMenuId", "Name", menuItemComboMenu.ComboMenuId);
            ViewData["MenuId"] = new SelectList(_context.MenuEntity, "MenuId", "Name", menuItemComboMenu.MenuId);
            return View(menuItemComboMenu);
        }

        // POST: Admin/MenuItemComboMenu/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Edit(int id, [Bind("MenuItemComboMenuId,MenuId,ComboMenuId")] MenuItemComboMenu menuItemComboMenu)
        {
            if (id != menuItemComboMenu.MenuItemComboMenuId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(menuItemComboMenu);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MenuItemComboMenuExists(menuItemComboMenu.MenuItemComboMenuId))
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
            ViewData["ComboMenuId"] = new SelectList(_context.ComboMenuEntity, "ComboMenuId", "Name", menuItemComboMenu.ComboMenuId);
            ViewData["MenuId"] = new SelectList(_context.MenuEntity, "MenuId", "Name", menuItemComboMenu.MenuId);
            return View(menuItemComboMenu);
        }
        [Authorize(Roles = "administrator system, admin")]

        // GET: Admin/MenuItemComboMenu/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.MenuItemComboMenu == null)
            {
                return NotFound();
            }

            var menuItemComboMenu = await _context.MenuItemComboMenu
                .Include(m => m.ComboMenuEntity)
                .Include(m => m.MenuEntity)
                .FirstOrDefaultAsync(m => m.MenuItemComboMenuId == id);
            if (menuItemComboMenu == null)
            {
                return NotFound();
            }

            return View(menuItemComboMenu);
        }
        [Authorize(Roles = "administrator system, admin")]

        // POST: Admin/MenuItemComboMenu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.MenuItemComboMenu == null)
            {
                return Problem("Entity set 'ApplicationDbContext.MenuItemComboMenu'  is null.");
            }
            var menuItemComboMenu = await _context.MenuItemComboMenu.FindAsync(id);
            if (menuItemComboMenu != null)
            {
                _context.MenuItemComboMenu.Remove(menuItemComboMenu);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MenuItemComboMenuExists(int id)
        {
          return (_context.MenuItemComboMenu?.Any(e => e.MenuItemComboMenuId == id)).GetValueOrDefault();
        }
    }
}
