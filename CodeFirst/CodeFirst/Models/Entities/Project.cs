using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("Project")]
    public class Project
    {
        [Key]
        public int ProjectId { get; set; }
        public string? Name { get; set; }
        //public string? Description { get; set; }
        //public DateTime? CreatedAt { get; set; }
        //public DateTime? UpdatedAt { get; set; }

        //public List<Task>? Tasks { get; set; }
    }
}
