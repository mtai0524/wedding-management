using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("ChatRoomUser")]
    public class ChatRoomUser
    {
        [Key]
        public int Id { get; set; }

        public int ChatRoomId { get; set; }

        [ForeignKey("ChatRoomId")]
        public virtual ChatRoom ChatRoom { get; set; }

        public string UserId { get; set; }

        [ForeignKey("UserId")]
        public virtual ApplicationUser User { get; set; }
    }
}
