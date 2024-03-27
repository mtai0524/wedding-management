using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{

    [Table("Chat")]
    public partial class Chat
    {
        [Key]
        public int ChatId { get; set; }
        public string? UserId { get; set; } // nhớ get set dùm, tên côt collumn Chat
        [ForeignKey("UserId")] // tên sẽ lưu trong db
        public virtual ApplicationUser? Id { get; set; } // tên cột trong bảng ApplicationUser (đặt tùy ý)

        public string Message { get; set; } = null!;
        public string MessageType { get; set; } = null!;
        public DateTime NotificationDateTime { get; set; }
        public string Avatar { get; set; } = null!;

        public int? ChatRoomDataId { get; set; }// Thay đổi kiểu dữ liệu thành nullable int
        [ForeignKey("ChatRoomDataId")]
        public virtual ChatRoom ChatRoomData { get; set; } // Navigation property
    }
}
