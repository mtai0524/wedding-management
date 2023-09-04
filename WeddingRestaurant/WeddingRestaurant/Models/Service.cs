using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WeddingRestaurant.Models;

public partial class Service
{
    public int Id { get; set; }

    [Required(ErrorMessage = "Vui lòng nhập tên dịch vụ.")]
    [Display(Name = "Tên dịch vụ")]
    public string Name { get; set; } = null!;

    public string? Description { get; set; }
}
