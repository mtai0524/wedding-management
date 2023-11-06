using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Chat
{
    public class Room
    {
        [Key]
        public int RoomId { get; set; }
        public string? Name { get; set; }

        [ForeignKey("AdminId")]
        public string? AdminId { get; set; }
        public ApplicationUser? Admin { get; set; } // người tạo Room

        public ICollection<Message>? Messages { get; set; }
    }
}
