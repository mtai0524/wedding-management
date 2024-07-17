using System;
using System.ComponentModel.DataAnnotations;
using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;

public class UniqueEmailAttribute : ValidationAttribute
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        var email = value as string;

        if (string.IsNullOrWhiteSpace(email))
        {
            // Trường email trống, không cần kiểm tra
            return ValidationResult.Success;
        }

        var userManager = validationContext.GetRequiredService<UserManager<ApplicationUser>>();

        var existingUser = userManager.FindByEmailAsync(email).GetAwaiter().GetResult();

        if (existingUser != null)
        {
            // Email đã tồn tại trong hệ thống
            return new ValidationResult(ErrorMessage ?? "Email đã được sử dụng cho một tài khoản khác.");
        }

        return ValidationResult.Success;
    }
}
