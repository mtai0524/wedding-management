using System;
using System.Collections.Generic;

namespace WeddingRestaurantManagement.Models;

public partial class Service
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }
}
