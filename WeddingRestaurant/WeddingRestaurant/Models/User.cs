using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WeddingRestaurant.Models;

public partial class User
{
	public User()
	{
	}

	public User(string name, string password, string role, string? avatar)
	{
		Name = name;
		Password = password;
		Role = role;
		Avatar = avatar;
	}
	public int Id { get; set; }
	[Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
    [Display(Name = "Tên đăng nhập hehe")]
    public string Name { get; set; } = null!;
	[Required(ErrorMessage = "Vui lòng nhập mật khẩu")]

	public string Password { get; set; } = null!;

    public string Role { get; set; } = null!;
	[Required(ErrorMessage = "Vui lòng chọn hình đại diện")]
	public string? Avatar { get; set; }
}
