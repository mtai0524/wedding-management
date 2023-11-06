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

        [ForeignKey("RoomId")]
        public int? RoomId { get; set; }
        public virtual Room? Room { get; set; }

        [ForeignKey("UserId")]
        public string? UserId { get; set; }
        public virtual ApplicationUser? ApplicationUser { get; set; }
    }
}
