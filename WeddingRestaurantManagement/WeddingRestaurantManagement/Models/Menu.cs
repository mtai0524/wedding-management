using System;
using System.Collections.Generic;

namespace WeddingRestaurantManagement.Models;

public partial class Menu
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public int? Type { get; set; }

    public int? Category { get; set; }

    public virtual MenuCategory? CategoryNavigation { get; set; }
}
