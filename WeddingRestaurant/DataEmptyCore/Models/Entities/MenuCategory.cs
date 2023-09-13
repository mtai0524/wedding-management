using System;
using System.Collections.Generic;

namespace DataEmptyCore.Models.Entities;

public partial class MenuCategory
{
    public int CategoryId { get; set; }

    public string CategoryName { get; set; } = null!;

    public string? Description { get; set; }

    public virtual ICollection<Menu> Menus { get; set; } = new List<Menu>();
}
