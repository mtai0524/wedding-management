namespace CodeFirst.Models
{
    public class InvoiceAndOrderMenusRequest
    {
        public string UserId { get; set; }
        public int? BranchId { get; set; } // Thêm BranchId
        public int? HallId { get; set; } // Thêm HallId
        public List<OrderMenuRequest> OrderMenus { get; set; }
        public List<OrderServiceRequest> OrderServices { get; set; }
        public DateTime? AttendanceDate { get; set; }
        public double? Total { get; set; }
    }
}
