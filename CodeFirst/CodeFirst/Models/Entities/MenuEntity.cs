using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class MenuEntity
    {
        [Key]
        public int MenuId { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên món ăn")]
        [Display(Name ="Tên món ăn")]
        public string? Name { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập giá món ăn")]
        [Display(Name = "Giá món ăn")]
        public double? Price { get; set; }
        [Display(Name = "Mô tả món ăn")]
        public string? Description { get; set; }
        [Display(Name = "Thể loại")]
        public int CategoryId { get; set; } // nhớ get set dùm
        [ForeignKey("CategoryId")]
        [Display(Name = "Thể loại")]
        public virtual MenuCategory? MenuCategory { get; set; }
    }
}
