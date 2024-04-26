using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("TaskToDo")]

    public class TaskToDo
    {
        [Key]
        public int TaskId { get; set; }
        public string? Name { get; set; }
        public int? Position { get; set; }

        public int? ProjectId { get; set; }
        [ForeignKey("ProjectId")]
        public virtual Project? Project { get; set; }
    }
}
