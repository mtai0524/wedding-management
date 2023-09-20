using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class ServiceCategory
    {
        [Key]
        public int CategoryId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
    }
}
