using CodeFirst.Models.Entities;

namespace CodeFirst.Models
{
    public class InvoiceAndOrderMenusRequest
    {
        public string UserId { get; set; }
        public int? BranchId { get; set; } // Thêm BranchId
        public int? HallId { get; set; } // Thêm HallId
        public List<OrderMenuRequest> OrderMenus { get; set; }
        public List<OrderServiceRequest> OrderServices { get; set; }
        public List<InvoiceCodeRequest> InvoiceCodeRequest { get; set; }
        public DateTime? AttendanceDate { get; set; }
        public double? Total { get; set; }
        public double? TotalBeforeDiscount { get; set; }
        public string? FullName { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Note { get; set; }
        public string? TimeHall { get; set; }
        public bool? PaymentWallet { get; set; }
        public double? DepositPayment { get; set; }


    }
}
