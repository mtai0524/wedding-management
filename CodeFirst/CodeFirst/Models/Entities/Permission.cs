using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("Permission")]
    public class Permission
    {
        [Key]
        public int Id { get; set; }
        public string? Type { get; set; }
        public string? RoleId { get; set; } // Khóa ngoại

        [ForeignKey("RoleId")]
        public virtual IdentityRole? Role { get; set; }
        public bool CanAdd { get; set; } = false;
        public bool CanEdit { get; set; } = false;
        public bool CanDelete { get; set; } = false;
    }
}
