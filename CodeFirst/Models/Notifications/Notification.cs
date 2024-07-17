using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Notifications
{
    [Table("Notification")]
    public partial class Notification
    {
        [Key]
        public int Id { get; set; }
        public string? UserId { get; set; } // nhớ get set dùm, tên côt collumn Chat
        [ForeignKey("UserId")] // tên sẽ lưu trong db
        public virtual ApplicationUser? User { get; set; } // tên cột trong bảng ApplicationUser (đặt tùy ý)
        public string Message { get; set; } = null!;
        public string MessageType { get; set; } = null!;
        public DateTime NotificationDateTime { get; set; }
    }
}
