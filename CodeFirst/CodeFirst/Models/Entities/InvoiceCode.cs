using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace CodeFirst.Models.Entities
{
    public class InvoiceCode
    {
        [Key]
        public int InvoiceCodeId { get; set; }
        public int? InvoiceId { get; set; }
        [ForeignKey("InvoiceId")]
        public virtual Invoice? Invoice { get; set; }
        public int? CodeId { get; set; }
        [ForeignKey("CodeId")]
        public virtual Code? Code { get; set; }
    }
}
