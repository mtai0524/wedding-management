using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class Branch
    {
        [Key]
        public int BranchId { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public List<Hall>? Halls { get; set; } = null;
    }
}
