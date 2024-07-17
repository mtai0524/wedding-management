using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class StatisticController : Controller
    {
        private readonly ApplicationDbContext _context;
        

        public StatisticController(ApplicationDbContext context )
        {
            _context = context;
        }

        public async Task<ActionResult> IndexAsync()
        {
            try
            {
                var userCount = await _context.ApplicationUser.CountAsync();
                ViewData["UserCount"] = userCount;

                // Lấy ngày hiện tại
                DateTime currentDate = DateTime.Now;

                // Lấy tháng và năm từ ngày hiện tại
                int currentMonth = currentDate.Month;
                int currentYear = currentDate.Year;
                ViewData["CurrentMonth"] = currentMonth;
                ViewData["CurrentYear"] = currentYear;

                var invoiceCount = await _context.Invoice.CountAsync();
                ViewData["InvoiceCount"] = invoiceCount;

                var invoices = await _context.Invoice.ToListAsync();
                double total = invoices.Sum(invoice => invoice.TotalBeforeDiscount ?? 0);
                ViewData["Total"] = string.Format("{0:0,0}", total) + " đ";

                int numberOfCustomers = _context.Invoice
                        .Select(i => i.UserId) // UserId của hóa đơn
                        .Distinct() // Loại trùng lặp
                        .Count(); // Đếm số lượng user
                ViewData["CustomerInvoice"] = numberOfCustomers;

                return View();
            }
            catch (Exception ex)
            {
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
