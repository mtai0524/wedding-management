using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace CodeFirst.Models.Entities
{
    public class Hall
    {
        [Key]
        public int HallId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public int? BranchId { get; set; } // nhớ get set dùm
        [ForeignKey("BranchId")]
        public virtual Branch? Branch{ get; set; }
        public int? Capacity { get; set; }
        [DisplayFormat(DataFormatString = "{0:#,##0} VNĐ")]
        public double? Price { get; set; }
    }
}
