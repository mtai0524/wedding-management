using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class MenuEntity
    {
        [Key]
        public int MenuId { get; set; }
        [Display(Name ="Tên món ăn")]
        public string? Name { get; set; }
        [Display(Name = "Giá món ăn")]
        public double? Price { get; set; }
        [Display(Name = "Mô tả món ăn")]
        public string? Description { get; set; }
        public int CategoryId { get; set; } // nhớ get set dùm
        [Display(Name = "Thể loại")]
        [ForeignKey("CategoryId")]
        public virtual MenuCategory? MenuCategory { get; set; }
    }
}
