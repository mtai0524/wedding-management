using System;
using System.Collections.Generic;

namespace WeddingRestaurantManagement.Models;

public partial class Bill
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? UserId { get; set; }

    public virtual User? User { get; set; }
}
