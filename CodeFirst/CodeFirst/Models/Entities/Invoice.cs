using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class Invoice
    {
        [Key]
        public int? InvoiceID { get; set; }

        public string? UserId { get; set; } // nhớ get set dùm
        [ForeignKey("UserId")]
        public virtual ApplicationUser? Id { get; set; }

        public int BranchId { get; set; } // Thêm BranchId
        [ForeignKey("BranchId")]
        public virtual Branch? Branch { get; set; } // Thêm liên kết đến Branch

        public int HallId { get; set; } // Thêm HallId
        [ForeignKey("HallId")]
        public virtual Hall? Hall { get; set; } // Thêm liên kết đến Hall
    }
}
