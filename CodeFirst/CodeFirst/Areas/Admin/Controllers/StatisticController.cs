using CodeFirst.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class StatisticController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager; // Sử dụng UserManager để quản lý người dùng

        public StatisticController(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }
        // GET: StatisticController
        public async Task<ActionResult> IndexAsync()
        {
            try
            {
                // Sử dụng UserManager để đếm số lượng người dùng
                var userCount = await _userManager.Users.CountAsync();

                // Trả về kết quả
                ViewData["UserCount"] = userCount;
                return View();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                ViewData["Error"] = ex.Message;
                return View();
            }
        }

        // GET: StatisticController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: StatisticController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: StatisticController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(IndexAsync));
            }
            catch
            {
                return View();
            }
        }

        // GET: StatisticController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: StatisticController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(IndexAsync));
            }
            catch
            {
                return View();
            }
        }

        // GET: StatisticController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: StatisticController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(IndexAsync));
            }
            catch
            {
                return View();
            }
        }
    }
}
