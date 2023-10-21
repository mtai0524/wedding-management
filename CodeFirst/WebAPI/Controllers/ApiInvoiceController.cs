using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
        [HttpPost("checked")]
        public IActionResult CheckDuplicateInvoice([FromBody] CheckDuplicateInvoice request)
        {
            var existingInvoice = _context.Invoice.FirstOrDefault(i =>
                i.AttendanceDate.Value.Date == request.AttendanceDate.Date &&
                i.BranchId == request.BranchId &&
                i.HallId == request.HallId);

            if (existingInvoice != null)
            {
                return BadRequest(new { message = "Chi nhánh và sảnh ngày hôm đó đã có người đặt" });
            }

            return Ok(new { message = "Không có hóa đơn trùng." });
        }
        [HttpPost]
        public async Task<IActionResult> CreateInvoiceAndOrderMenus([FromBody] InvoiceAndOrderMenusRequest request)
        {

            // Kiểm tra xem đã có hóa đơn nào cùng ngày, cùng sảnh và cùng chi nhánh chưa
            var existingInvoice = _context.Invoice
                .FirstOrDefault(i => i.AttendanceDate.HasValue &&
                    i.AttendanceDate.Value.Date == request.AttendanceDate.Value.Date &&
                    i.BranchId == request.BranchId &&
                    i.HallId == request.HallId);
            if (existingInvoice != null)
            {
                return BadRequest(new { message = "Đã có hóa đơn được tạo trong cùng một ngày, cùng chi nhánh và cùng sảnh." });
            }
            // Tạo một đối tượng Invoice từ dữ liệu gửi từ React
            var invoice = new Invoice
            {
                UserId = request.UserId,
                BranchId = (int)request.BranchId,
                HallId = (int)request.HallId,
                InvoiceDate = DateTime.Now,
                Total = request.Total,
                TotalBeforeDiscount = request.TotalBeforeDiscount,
                FullName = request.FullName,
                PhoneNumber = request.PhoneNumber,
                Note = request.Note,
            };

            // Kiểm tra ngày AttendanceDate
            if (request.AttendanceDate.HasValue)
            {
                // Kiểm tra nếu AttendanceDate cách ngày hiện tại ít nhất 20 ngày
                TimeSpan difference = request.AttendanceDate.Value - DateTime.Now;
                if (difference.Days < 20)
                {
                    return BadRequest(new { message = "Ngày đến tham dự phải cách ngày hiện tại ít nhất 20 ngày." });
                }
                invoice.AttendanceDate = request.AttendanceDate;
            }

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

            var orderServices = request.OrderServices.Select(orderService => new OrderService
            {
                InvoiceID = invoice.InvoiceID, // Liên kết với hóa đơn mới tạo
                ServiceId = orderService.ServiceId
            }).ToList();

            // Thêm danh sách các món đã đặt vào DbContext và lưu vào cơ sở dữ liệu
            _context.OrderService.AddRange(orderServices);
            await _context.SaveChangesAsync();

            //if (request.InvoiceCode != null && request.InvoiceCode.Any())
            //{
            // Tạo danh sách các đối tượng InvoiceCode và thêm thông tin mã giảm giá
            var invoiceCodes = request.InvoiceCodeRequest.Select(codeId => new InvoiceCode
            {
                InvoiceId = invoice.InvoiceID,
                CodeId = codeId.CodeId
            }).ToList();

            // Thêm danh sách các InvoiceCode vào DbContext và lưu vào cơ sở dữ liệu
            _context.InvoiceCode.AddRange(invoiceCodes);
            await _context.SaveChangesAsync();
            //}

            return Ok(new { message = "Hóa đơn và món đã đặt đã được tạo thành công!" });
        }
        [HttpGet("booked-hall")]
        public IActionResult GetBookedHalls()
        {
            // Lấy ngày hiện tại
            var currentDate = DateTime.Now.Date;

            // Truy vấn cơ sở dữ liệu để lấy danh sách các sảnh đã có người đặt từ ngày hiện tại trở về sau và sắp xếp theo AttendanceDate tăng dần
            var bookedHalls = _context.Invoice
                .Where(i => i.HallId != null && i.AttendanceDate >= currentDate)
                .Select(i => new
                {
                    HallId = i.HallId,
                    HallName = i.Hall.Name,
                    BranchName = i.Branch.Name,
                    BookingDate = i.AttendanceDate
                })
                .OrderBy(i => i.BookingDate)
                .ToList();

            return Ok(bookedHalls);
        }

        [HttpGet("get-invoice/{userId}")]
        public IActionResult GetInvoicesByUser(string userId)
        {
            try
            {
                // Truy vấn danh sách hóa đơn dựa trên UserId và kèm theo thông tin OrderMenu và OrderService
                var invoices = _context.Invoice
                    .Where(i => i.UserId == userId)
                    .Include(i => i.Branch)
                    .Include(i => i.Hall)
                    .Include(i => i.OrderMenus) // Kèm thông tin OrderMenu
                        .ThenInclude(om => om.MenuEntity) // Kèm thông tin MenuEntity
                    .Include(i => i.OrderServices) // Kèm thông tin OrderService
                        .ThenInclude(os => os.ServiceEntity) // Kèm thông tin ServiceEntity
                    .ToList();

                return Ok(invoices);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                return StatusCode(500, new { message = "Lỗi server: " + ex.Message });
            }
        }
        [HttpGet("promo-code")]
        public async Task<ActionResult<IEnumerable<Code>>> GetPromoCodes()
        {
            var promoCodes = await _context.Code.ToListAsync();
            return Ok(promoCodes);
        }
        [HttpPost("use-promo-code")]
        public async Task<ActionResult> UsePromoCode(int codeId)
        {
            var code = await _context.Code.FindAsync(codeId);

            if (code != null && code.Quantity > 0)
            {
                code.Quantity--; // Giảm số lượng mã giảm giá
                if (code.Quantity <= 0)
                {
                    _context.Code.Remove(code); // Xóa mã nếu hết lượt sử dụng
                }
                await _context.SaveChangesAsync();
                return Ok("Mã giảm giá đã được sử dụng.");
            }

            return BadRequest("Mã giảm giá không hợp lệ hoặc đã hết lượt sử dụng.");
        }

        
    }
}
