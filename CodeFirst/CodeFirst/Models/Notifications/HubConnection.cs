using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Notifications
{
    public partial class HubConnection
    {
        [Key]
        public int Id { get; set; }
        public string ConnectionId { get; set; } = null!;
        public string Username { get; set; } = null!;
    }
}
