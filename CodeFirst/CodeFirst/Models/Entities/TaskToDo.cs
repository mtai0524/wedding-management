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
        public string? Priority { get; set; }
        public int? Position { get; set; }

        public int? ProjectId { get; set; }
        [ForeignKey("ProjectId")]
        public virtual Project? Project { get; set; }

        public string? UserId { get; set; } // nhớ get set dùm, tên côt collumn Chat
        [ForeignKey("UserId")] // tên sẽ lưu trong db
        public virtual ApplicationUser? User { get; set; } // tên cột trong bảng ApplicationUser (đặt tùy ý)

        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? TaskColor { get; set; }

    }
}
