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
using System.Text;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;

namespace CodeFirst.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class InvoiceController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IConverter _pdfConverter;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly INotyfService _noti;

        public InvoiceController(ApplicationDbContext context, IConverter pdfConverter, UserManager<ApplicationUser> userManager, INotyfService noti)
        {
            _context = context;
            _pdfConverter = pdfConverter;
            _userManager = userManager;
            _noti = noti;
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
            var orderServices = _context.OrderService.Where(om => om.InvoiceID == invoiceId).ToList();

            var htmlBuilder1 = new StringBuilder();
            var htmlBuilder2 = new StringBuilder();
            var htmlBuilder3 = new StringBuilder();

            htmlBuilder3.Append("<tr>");
            htmlBuilder3.Append("<td>" + invoice.Hall.Name + "</td>");
            htmlBuilder3.Append("<td style='text-align: right;'>" + string.Format("{0:0,0}", invoice.Hall.Price) + " VNĐ</td>");
            htmlBuilder3.Append("</tr>");

            foreach (var orderMenu in orderMenus)
            {
                var menuEntity = _context.MenuEntity.Find(orderMenu.MenuId);
                if (menuEntity != null)
                {
                    htmlBuilder1.Append("<tr>");
                    htmlBuilder1.Append("<td>" + menuEntity.Name + "</td>");
                    htmlBuilder1.Append("<td style='text-align: right;'>" + string.Format("{0:0,0}", menuEntity.Price) + " VNĐ</td>");
                    htmlBuilder1.Append("</tr>");
                }
            }

            foreach (var orderService in orderServices)
            {
                var serviceEntity = _context.ServiceEntity.Find(orderService.ServiceId);
                if (serviceEntity != null)
                {
                    htmlBuilder2.Append("<tr>");
                    htmlBuilder2.Append("<td>" + serviceEntity.Name + "</td>");
                    htmlBuilder2.Append("<td style='text-align: right;'>" + string.Format("{0:0,0}", serviceEntity.Price) + " VNĐ</td>");
                    htmlBuilder2.Append("</tr>");
                }
            }

            var html = @"
<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
  table {
width: 100%;
        border-collapse: collapse;
        border: none; /* Xóa border của table */
    }

    th, td {
        border: none; /* Xóa border của các ô */
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }
        body {
            position: relative;
        }

        .invoice, td,th {
            letter-spacing: 1px;
        }
.idinvoice{
            letter-spacing: 0.5px;
            position: absolute;
            top: 10px;
            left: 1px;
            font-size: 13px;
color:gray;
}
        .date-time {
            letter-spacing: 0.5px;
            position: absolute;
            top: 10px;
            right: 1px;
            font-size: 13px;
color:gray;

        }

      
h1, h2, h5{
    text-align:center;
}
span{
font-weight:bold;
}
    </style>
</head>
<body>
<br/>
    <h2 class=""invoice"">Hóa đơn thanh toán</h2>
    <p class=""idinvoice"">Mã hóa đơn: " + invoice.InvoiceID + @"</p>
    <p class=""invoice""><span>Email khách hàng: </span>" + user.Email + @"</p>
    <p class=""invoice""><span>Chi nhánh: </span>" + invoice.Branch.Name + @"</p>
    <p class=""invoice""><span>Nhân viên in hóa đơn: </span>" + userCurrent.ToString() + @"</p>
    <p class=""date-time"">Ngày giờ: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + @"</p>
    

   <h2 class=""invoice"">Sảnh đã đặt</h2>
    <table>
        <tr>
            <th>Tên sảnh</th>
            <th style='text-align: right;'>Giá</th>
        </tr>";

            html += htmlBuilder3.ToString();

            html += @"
    </table>

    <h2 class=""invoice"">Danh sách món ăn đã đặt</h2>
    <table>
        <tr>
            <th>Tên món ăn</th>
            <th style='text-align: right;'>Giá</th>
        </tr>";

            html += htmlBuilder1.ToString();

            html += @"
    </table>

    <h2 class=""invoice"">Danh sách dịch vụ đã đặt</h2>
    <table>
        <tr>
            <th>Tên dịch vụ</th>
            <th style='text-align: right;'>Giá</th>
        </tr>";

            html += htmlBuilder2.ToString();

            html += @"
    </table>
<table>
<tr>
<th style='background-color:white;text-align: left;' class=""invoice"">Tổng tiền:</th>
    <td style='color:red;text-align: right;' class=""invoice"">" + string.Format("{0:0,0}", invoice.TotalBeforeDiscount) +" VNĐ" + @"</td>
</tr>
<tr>
<th style='background-color:white;text-align: left;' class=""invoice"">Tổng tiền sau khi giảm giá:</th>

    <td style='color:red;text-align: right;' class=""invoice"">" + string.Format("{0:0,0}", invoice.Total) +" VNĐ" + @"</td>
</tr>
</table>
<h2>~ Xin hẹn gặp lại quý khách ~</h2>
</body>
</html>
";

            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                PaperSize = PaperKind.A5,
                Orientation = Orientation.Portrait,
                Margins = new MarginSettings { Top = 10 },
            };

            var objectSettings = new ObjectSettings
            {
                PagesCount = true,
                HtmlContent = html,
                WebSettings = { DefaultEncoding = "utf-8" },
                HeaderSettings = { FontName = "Tahoma", FontSize = 12, Right = "", Line = true },
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
            var applicationDbContext = _context.Invoice.Include(i => i.Branch).Include(i => i.Hall).Include(i => i.User);
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
                .Include(i => i.User)
                .Include(i => i.OrderMenus)
                .ThenInclude(o => o.MenuEntity) // nạp MenuEntity
                  .Include(i => i.OrderServices)
                .ThenInclude(o => o.ServiceEntity) // nạp ServiceEntity
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
        [Authorize(Roles = "administrator system, admin")]

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Invoice == null)
            {
                return NotFound();
            }

            var invoice = await _context.Invoice
                .Include(i => i.Branch)
                .Include(i => i.Hall)
                .Include(i => i.User)
                .FirstOrDefaultAsync(m => m.InvoiceID == id);
            if (invoice == null)
            {
                return NotFound();
            }

            return View(invoice);
        }

        // POST: Admin/Invoice/Delete/5
        [Authorize(Roles = "administrator system, admin")]

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            if (_context.Invoice == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Invoice'  is null.");
            }

            var invoice = await _context.Invoice.FindAsync(id);

            if (invoice == null)
            {
                return NotFound();
            }

            // Lấy danh sách các bản ghi OrderMenu liên quan đến hóa đơn cần xóa
            var orderMenus = _context.OrderMenu.Where(om => om.InvoiceID == id);
            var orderServices = _context.OrderService.Where(om => om.InvoiceID == id);
            var code = _context.InvoiceCode.Where(om => om.InvoiceId == id);

            // Xóa các bản ghi OrderMenu
            _context.OrderMenu.RemoveRange(orderMenus);
            _context.InvoiceCode.RemoveRange(code);
            _context.OrderService.RemoveRange(orderServices);

            // Xóa hóa đơn
            _context.Invoice.Remove(invoice);

            await _context.SaveChangesAsync();
            _noti.Success("Xóa hóa đơn gòi nha!");

            return RedirectToAction(nameof(Index));
        }


        private bool InvoiceExists(int? id)
        {
          return (_context.Invoice?.Any(e => e.InvoiceID == id)).GetValueOrDefault();
        }
    }
}
