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
    }
}
