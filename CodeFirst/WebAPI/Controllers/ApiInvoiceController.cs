using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/invoice")]
    [ApiController]
    public class ApiInvoiceController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ApiInvoiceController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> CreateInvoiceAndOrderMenus([FromBody] InvoiceAndOrderMenusRequest request)
        {
            // Tạo một đối tượng Invoice từ dữ liệu gửi từ React
            var invoice = new Invoice
            {
                UserId = request.UserId
            };

            // Thêm đối tượng Invoice vào DbContext và lưu vào cơ sở dữ liệu
            _context.Invoice.Add(invoice);
            await _context.SaveChangesAsync();

            // Tạo danh sách các món đã đặt từ dữ liệu gửi từ React
            var orderMenus = request.OrderMenus.Select(orderMenu => new OrderMenu
            {
                InvoiceID = invoice.InvoiceID, // Liên kết với hóa đơn mới tạo
                MenuId = orderMenu.MenuID
            }).ToList();

            // Thêm danh sách các món đã đặt vào DbContext và lưu vào cơ sở dữ liệu
            _context.OrderMenu.AddRange(orderMenus);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Hóa đơn và món đã đặt đã được tạo thành công!" });
        }
    }
}
