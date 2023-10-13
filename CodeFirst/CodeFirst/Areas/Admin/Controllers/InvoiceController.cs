using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using DinkToPdf.Contracts;
using DinkToPdf;
using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class InvoiceController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IConverter _pdfConverter;
        private readonly UserManager<ApplicationUser> _userManager;

        public InvoiceController(ApplicationDbContext context, IConverter pdfConverter, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _pdfConverter = pdfConverter;
            _userManager = userManager;
        }
        [HttpPost]
        public IActionResult CalculateChange(decimal total, decimal amountPaid)
        {
            decimal changeAmount = CalculateChangeAmount(total, amountPaid);
            if (changeAmount < 0)
            {
                return Json(new { error = "Số tiền khách đưa không đủ." });
            }
            return Json(new { change = changeAmount });
        }
        private decimal CalculateChangeAmount(decimal total, decimal amountPaid)
        {
            if (total > amountPaid)
            {
                // Trường hợp số tiền khách đưa không đủ để trả tiền
                return -1;
            }

            // Tính số tiền thừa
            decimal changeAmount = amountPaid - total;
            return changeAmount;
        }

        private Invoice GetInvoiceFromDatabase(int invoiceId)
        {
            // Sử dụng Entity Framework để lấy hóa đơn từ cơ sở dữ liệu
            var invoice = _context.Invoice
                        .Include(i => i.Branch)
                        .Include(i => i.Hall)
                        .FirstOrDefault(i => i.InvoiceID == invoiceId);
            return invoice;
        }
        public async Task<IActionResult> GenerateInvoicePDFAsync(int invoiceId)
        {
            var invoice = GetInvoiceFromDatabase(invoiceId);
            var user = await _userManager.FindByIdAsync(invoice.UserId);
            var userCurrent = await _userManager.GetUserAsync(User);
            if (invoice == null)
            {
                return NotFound();
            }

            // Lấy danh sách OrderMenu dựa trên InvoiceID
            var orderMenus = _context.OrderMenu.Where(om => om.InvoiceID == invoiceId).ToList();
  

            // Tạo một chuỗi HTML trực tiếp thay vì render một view
            var html = @"
<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        body {
            position: relative;
        }

        .invoice {
            letter-spacing: 1px;
            color: red;
        }

        .date-time {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 10px;
        }
    </style>
</head>
<body>
    <h1 class=""invoice"">Invoice</h1>
    <p class=""invoice"">Invoice ID: " + invoice.InvoiceID + @"</p>
    <p class=""invoice"">Email khách hàng: " + user.Email + @"</p>
    <p class=""invoice"">Branch Name: " + invoice.Branch.Name + @"</p>
    <p class=""invoice"">Hall Name: " + invoice.Hall.Name + @"</p>
    <p class=""invoice"">Nhân viên in hóa đơn: " + userCurrent.ToString() + @"</p>
    <p class=""date-time"">Ngày giờ: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + @"</p>
    
    <h2 class=""invoice"">Danh sách món ăn đã đặt:</h2>
    <ul class=""invoice""> ";
            foreach (var orderMenu in orderMenus)
            {
                var menuEntity = _context.MenuEntity.Find(orderMenu.MenuId);
                if (menuEntity != null)
                {
                    html += $"<li>{menuEntity.Name} - {menuEntity.Price} VNĐ</li>";
                }
            }

            html += @"
    </ul>
</body>
</html>
";

            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                PaperSize = PaperKind.A6,
                Orientation = Orientation.Portrait,
                Margins = new MarginSettings { Top = 10 },
            };

            var objectSettings = new ObjectSettings
            {
                PagesCount = true,
                HtmlContent = html,
                WebSettings = { DefaultEncoding = "utf-8" },
                HeaderSettings = { FontName = "Tahoma", FontSize = 12, Right = "Page [page] of [toPage]", Line = true },
            };

            var pdf = new HtmlToPdfDocument()
            {
                GlobalSettings = globalSettings,
                Objects = { objectSettings }
            };

            var pdfBytes = _pdfConverter.Convert(pdf);

            var pdfFileName = $"HoaDonNhaHang_{invoiceId}.pdf";

            return File(pdfBytes, "application/pdf", pdfFileName);
        }




        // GET: Admin/Invoice
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Invoice.Include(i => i.Branch).Include(i => i.Hall).Include(i => i.Id);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Admin/Invoice/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Invoice == null)
            {
                return NotFound();
            }

            var invoice = await _context.Invoice
                .Include(i => i.Branch)
                .Include(i => i.Hall)
                .Include(i => i.Id)
                .FirstOrDefaultAsync(m => m.InvoiceID == id);
            if (invoice == null)
            {
                return NotFound();
            }

            return View(invoice);
        }

        // GET: Admin/Invoice/Create
        public IActionResult Create()
        {
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId");
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId");
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id");
            return View();
        }

        // POST: Admin/Invoice/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("InvoiceID,UserId,BranchId,HallId")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                _context.Add(invoice);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", invoice.BranchId);
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", invoice.HallId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", invoice.UserId);
            return View(invoice);
        }

        // GET: Admin/Invoice/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Invoice == null)
            {
                return NotFound();
            }

            var invoice = await _context.Invoice.FindAsync(id);
            if (invoice == null)
            {
                return NotFound();
            }
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", invoice.BranchId);
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", invoice.HallId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", invoice.UserId);
            return View(invoice);
        }

        // POST: Admin/Invoice/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int? id, [Bind("InvoiceID,UserId,BranchId,HallId")] Invoice invoice)
        {
            if (id != invoice.InvoiceID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(invoice);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InvoiceExists(invoice.InvoiceID))
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
            ViewData["BranchId"] = new SelectList(_context.Branch, "BranchId", "BranchId", invoice.BranchId);
            ViewData["HallId"] = new SelectList(_context.Hall, "HallId", "HallId", invoice.HallId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", invoice.UserId);
            return View(invoice);
        }

        // GET: Admin/Invoice/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Invoice == null)
            {
                return NotFound();
            }

            var invoice = await _context.Invoice
                .Include(i => i.Branch)
                .Include(i => i.Hall)
                .Include(i => i.Id)
                .FirstOrDefaultAsync(m => m.InvoiceID == id);
            if (invoice == null)
            {
                return NotFound();
            }

            return View(invoice);
        }

        // POST: Admin/Invoice/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            if (_context.Invoice == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Invoice'  is null.");
            }
            var invoice = await _context.Invoice.FindAsync(id);
            if (invoice != null)
            {
                _context.Invoice.Remove(invoice);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InvoiceExists(int? id)
        {
          return (_context.Invoice?.Any(e => e.InvoiceID == id)).GetValueOrDefault();
        }
    }
}
