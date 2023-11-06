using CodeFirst.Models;

namespace CodeFirst.Chat.Entities
{
    public class Message
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }
        public int ToRoomId { get; set; }
        public Room ToRoom { get; set; }
        public ApplicationUser FromUser { get; set; }
    }
}
