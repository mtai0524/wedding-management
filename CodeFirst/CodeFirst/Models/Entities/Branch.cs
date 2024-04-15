using System.ComponentModel.DataAnnotations;

namespace CodeFirst.Models.Entities
{
    public class Branch
    {
        [Key]
        public int BranchId { get; set; }
        [Required(ErrorMessage = "Tên chi nhánh không được để trống.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Mô tả không được để trống.")]
        public string? Description { get; set; }
        public string? Image { get; set; }
        [Required(ErrorMessage = "Địa chỉ không được để trống.")]
        public string? Address { get; set; }
        [Required(ErrorMessage = "Điện thoại không được để trống.")]
        public string? Phone { get; set; }

        public List<Hall>? Halls { get; set; } = null;
        public bool IsLocked { get; set; }
    }
}
