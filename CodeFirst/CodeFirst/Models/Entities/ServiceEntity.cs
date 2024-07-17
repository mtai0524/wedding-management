using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class ServiceEntity
    {
        [Key]
        public int ServiceId { get; set; }
        public string? Name { get; set; }
        [DisplayFormat(DataFormatString = "{0:#,##0} VNĐ")]
        public double? Price { get; set; }
        public string? Description { get; set; }
        public int CategoryId { get; set; } // nhớ get set dùm
        [ForeignKey("CategoryId")]
        public virtual ServiceCategory? ServiceCategory { get; set; }

        public string? Image { get; set; }
    }
}
