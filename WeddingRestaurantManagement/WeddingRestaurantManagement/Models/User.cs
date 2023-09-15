using System;
using System.Collections.Generic;

namespace WeddingRestaurantManagement.Models;

public partial class User
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Role { get; set; } = null!;

    public string? Avatar { get; set; }

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();
}
