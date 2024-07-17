using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class TimeOfDay
    {
        [Key]
        public int Id { get; set; }

        public int? HallId { get; set; } // nhớ get set dùm
        [ForeignKey("HallId")]
        public virtual Hall? Hall { get; set; }

        public string? Morning { get; set; }
        public string? Afternoon { get; set; }
        public string? Dinner { get; set; }
    }
}
