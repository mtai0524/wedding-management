using System;
using System.Collections.Generic;

namespace WeddingRestaurantManagement.Models;

public partial class ServiceCategory
{
    public int CategoryId { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;
}
