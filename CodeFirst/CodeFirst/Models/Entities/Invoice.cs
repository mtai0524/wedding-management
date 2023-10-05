using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class Invoice
    {
        [Key]
        public int? InvoiceID { get; set; }
        public int? UserId { get; set; }
    }
}
