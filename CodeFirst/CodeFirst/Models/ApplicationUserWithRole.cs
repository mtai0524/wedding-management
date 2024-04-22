namespace CodeFirst.Models
{
    public class ApplicationUserWithRole
    {
        public string? UserId { get; set; }
        public string? Username { get; set; }
        public string? Role { get; set; }
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Avatar { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public bool? LockoutEnabled { get; set; }
        public string? FullName { get; set; }
        public DateTimeOffset? LockoutEnd { get; set; }

    }
}
