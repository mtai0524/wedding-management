using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class Invoice
    {
        [Display(Name = "Id hóa đơn")]

        [Key]
        public int? InvoiceID { get; set; }
        [Display(Name = "Id khách hàng")]

        public string? UserId { get; set; } // nhớ get set dùm
        [ForeignKey("UserId")]
        public virtual ApplicationUser? Id { get; set; }
        [Display(Name = "Chi nhánh")]

        public int BranchId { get; set; } // Thêm BranchId
        [ForeignKey("BranchId")]
        public virtual Branch? Branch { get; set; } // Thêm liên kết đến Branch
        [Display(Name = "Sảnh")]

        public int HallId { get; set; } // Thêm HallId
        [ForeignKey("HallId")]
        public virtual Hall? Hall { get; set; } // Thêm liên kết đến Hall
    }
}
