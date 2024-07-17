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

        public int? ChatRoomDataId { get; set; }
        [ForeignKey("ChatRoomDataId")]
        public virtual ChatRoom ChatRoomData { get; set; } 
        public string? ImageChatRoom { get; set; } = null; // cho phép null và giá trị mặc định là null

    }
}
