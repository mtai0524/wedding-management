using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class Code
    {
        [Key]
        public int CodeId { get; set; }
        public string? CodeString { get; set; } // Mã khuyến mãi
        public double? Discount{ get; set; } // Số tiền giảm giá
        public int? Quantity { get; set; } // Số lượng mã giảm giá
        public DateTime? ExpirationDate { get; set; } // Ngày hết hạn
        public virtual ICollection<InvoiceCode>? InvoiceCode { get; set; }
    }
}
