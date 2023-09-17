
using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models
{
    public class Menu
    {
        public int MenuId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public int DiscountId { get; set; }
        [Display(Name = "Image Public ID")]
        public string ImagePublicId { get; set; }

        [Display(Name = "Image URL")]
        public string ImageUrl { get; set; }
    }
}
