using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class OrderService
    {
        [Key]
        public int? OrderServiceId { get; set; }

        public int? InvoiceID { get; set; } // nhớ get set dùm
        [ForeignKey("InvoiceID")]
        public virtual Invoice? Invoice { get; set; }

        public int? ServiceId { get; set; } // nhớ get set dùm
        [ForeignKey("ServiceId")]
        public virtual ServiceEntity? ServiceEntity { get; set; }
    }
}
