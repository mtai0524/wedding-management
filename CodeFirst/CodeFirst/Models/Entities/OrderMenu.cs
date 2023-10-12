using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class OrderMenu
    {
        [Key]
        public int? OrderMenuId { get; set; }

        public int? InvoiceID { get; set; } // nhớ get set dùm
        [ForeignKey("InvoiceID")]
        public virtual Invoice? Invoice { get; set; }

        public int? MenuId { get; set; } // nhớ get set dùm
        [ForeignKey("MenuId")]
        public virtual MenuEntity? MenuEntity { get; set; }
    }
}
