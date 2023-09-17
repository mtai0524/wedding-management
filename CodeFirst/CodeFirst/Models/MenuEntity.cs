using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models
{
    public class MenuEntity
    {
        [Key]
        public int MenuId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public int DiscountId { get; set; }
        public string? ImageUrl { get; set; }
    }
}
