using System;
using System.Collections.Generic;

namespace WeddingRestaurant.Models;

public partial class Menu
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public int? Type { get; set; }
}
