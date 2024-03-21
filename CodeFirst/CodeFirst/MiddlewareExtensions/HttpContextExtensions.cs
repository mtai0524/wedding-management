using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace CodeFirst.MiddlewareExtensions
{
    public static class HttpContextExtensions
    {
        public static async Task<ApplicationUser> GetUserAsync(this HttpContext httpContext, UserManager<ApplicationUser> userManager)
        {
            var userId = httpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userId != null)
            {
                return await userManager.FindByIdAsync(userId);
            }
            return null;
        }
    }
}
