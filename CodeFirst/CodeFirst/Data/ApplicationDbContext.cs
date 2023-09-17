using CodeFirst.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Data
{
    public class ApplicationDbContext : IdentityDbContext
    { 
   
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<EmployeeEntity> Employee { get; set; }
        public DbSet<ApplicationUser> ApplicationUser { get; set; }
        public DbSet<Menu> Menu { get; set; }
    }
}
