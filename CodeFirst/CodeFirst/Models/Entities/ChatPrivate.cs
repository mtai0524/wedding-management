using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("ChatPrivate")]
    public class ChatPrivate
    {
        [Key]
        public int ChatPrivateId { get; set; }

        public string? SenderUserId { get; set; } // Id của người gửi
        [ForeignKey("SenderUserId")]
        public virtual ApplicationUser? SenderUser { get; set; } 

        public string? ReceiverUserId { get; set; } // Id của người nhận
        [ForeignKey("ReceiverUserId")]
        public virtual ApplicationUser? ReceiverUser { get; set; } 

        public string Message { get; set; } = null!;
        public string? ImageChat { get; set; } = null;

        public DateTime NotificationDateTime { get; set; }

    }
}
