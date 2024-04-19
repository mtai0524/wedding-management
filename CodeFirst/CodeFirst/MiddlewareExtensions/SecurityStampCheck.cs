using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;

namespace CodeFirst.MiddlewareExtensions
{
    public class SecurityStampCheck
    {
        private readonly RequestDelegate _next;

        public SecurityStampCheck(RequestDelegate next)
        {
            _next = next;
        }
        public async Task Invoke(HttpContext context, UserManager<ApplicationUser> userManager)
        {
            if(context.User.Identity == null)
            {
                await _next(context);
                return;
            }
            if (context.User.Identity.IsAuthenticated)
            {
                var ssCookie  = context.User.Claims.FirstOrDefault(x => x.Type.Contains("SecurityStamp"))!.Value;
                var user = await userManager.GetUserAsync(context.User);
                if(ssCookie != user.SecurityStamp)
                {
                    context.Response.Cookies.Delete("MinhTai");
                    context.Response.Redirect("/Identity/Account/Login?ReturnUrl=%2F");
                }
            }

            await _next(context);
            return;
        }
    }
}
