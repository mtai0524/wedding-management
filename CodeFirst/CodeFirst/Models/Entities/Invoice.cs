using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class Invoice
    {
        [Display(Name = "Id hóa đơn")]

        [Key]
        public int InvoiceID { get; set; }
        [Display(Name = "Id khách hàng")]

        public string? UserId { get; set; } // nhớ get set dùm
        [ForeignKey("UserId")]
        public virtual ApplicationUser? User { get; set; }
        [Display(Name = "Chi nhánh")]

        public int BranchId { get; set; } // Thêm BranchId
        [ForeignKey("BranchId")]
        public virtual Branch? Branch { get; set; } // Thêm liên kết đến Branch
        [Display(Name = "Sảnh")]

        public int HallId { get; set; } // Thêm HallId
        [ForeignKey("HallId")]
        public virtual Hall? Hall { get; set; } // Thêm liên kết đến Hall
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}", ApplyFormatInEditMode = true)]
        [Display(Name = "Ngày tạo hóa đơn")]
        public DateTime? InvoiceDate { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Ngày đến tham dự")]
        public DateTime? AttendanceDate { get; set; }
        [Display(Name = "Tổng thanh toán")]
        [DisplayFormat(DataFormatString = "{0:#,##0} VNĐ")]
        public double? Total { get; set; }
        [Display(Name = "Tổng thanh toán trước giảm giá")]
        [DisplayFormat(DataFormatString = "{0:#,##0} VNĐ")]
        public double? TotalBeforeDiscount { get; set; }
        [Display(Name = "Họ và tên")]
        public string? FullName { get; set; }
        [Display(Name = "Số điện thoại")]
        public string? PhoneNumber { get; set; }
        [Display(Name = "Ghi chú")]
        public string? Note { get; set; }
        [Display(Name = "Danh sách các món ăn")]
        public virtual List<OrderMenu> OrderMenus { get; set; }
        [Display(Name = "Danh sách các dịch vụ")]
        public virtual List<OrderService> OrderServices { get; set; }
        public virtual ICollection<InvoiceCode> InvoiceCode { get; set; }

        public bool? PaymentStatus { get; set; }
        public string? OrderStatus { get; set; }
        public string? TimeHall { get; set; }
        public bool? PaymentWallet { get; set; }
        public double? DepositPayment { get; set; }
        public bool? PaymentCompleteWallet { get; set; }

    }
}
