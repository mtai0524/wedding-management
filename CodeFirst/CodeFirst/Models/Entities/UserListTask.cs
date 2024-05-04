using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("UserListTask")]
    public class UserListTask
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserListTaskId { get; set; }

        public int? TaskId { get; set; }
        [ForeignKey("TaskId")]
        public virtual TaskToDo? TaskToDo { get; set; }
        public string? UserId { get; set; } // nhớ get set dùm, tên côt collumn Chat
        [ForeignKey("UserId")] // tên sẽ lưu trong db
        public virtual ApplicationUser? User { get; set; }
    }
}
