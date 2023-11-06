using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Chat
{
    public class Message
    {
        [Key]
        public int MessageId { get; set; }
        public string? Content { get; set; }
        public DateTime? Timestamp { get; set; }

        public int? RoomId { get; set; }
        [ForeignKey("RoomId")]
        public virtual Room? Room { get; set; }

        public string? UserId { get; set; }
        [ForeignKey("UserId")]
        public virtual ApplicationUser? ApplicationUser { get; set; }
    }
}
