using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class Code
    {
        [Key]
        [Display(Name = "ID")]
        public int CodeId { get; set; }
        [Display(Name = "Mã khuyến mãi")]

        public string? CodeString { get; set; } // Mã khuyến mãi
        [Display(Name = "Giảm giá")]

        public double? Discount{ get; set; } // Số tiền giảm giá
        [Display(Name = "Số lượng")]

        public int? Quantity { get; set; } // Số lượng mã giảm giá
        [Display(Name = "Ngày hết hạn")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}", ApplyFormatInEditMode = true)]
        public DateTime? ExpirationDate { get; set; } // Ngày hết hạn
        public virtual ICollection<InvoiceCode>? InvoiceCode { get; set; }
    }
}
