using CodeFirst.Models;

namespace CodeFirst.Chat.Entities
{
    public class Room
    {
        public int Id { get; set; }
        public string Name { get; set; }
        //public ApplicationUser Admin { get; set; }
        public ICollection<Message> Messages { get; set; }
    }
}
