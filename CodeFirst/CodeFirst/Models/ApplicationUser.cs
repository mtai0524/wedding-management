using Microsoft.AspNetCore.Identity;

namespace CodeFirst.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? Avatar{ get; set; }
        public string? SessionId { get; set; }
    }
}
