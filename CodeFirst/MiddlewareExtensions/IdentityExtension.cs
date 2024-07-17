using CodeFirst.Data;
using CodeFirst.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace CodeFirst.MiddlewareExtensions
{
    public static class IdentityExtension
    {
        public static IServiceCollection LoadIdentityExtensions(this IServiceCollection services, IConfiguration config) {
            services.AddIdentity<ApplicationUser, IdentityRole>(opt =>
            {
                opt.Password.RequiredLength = 10;
                opt.Password.RequireNonAlphanumeric = true;
                opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromSeconds(60);
                opt.Lockout.MaxFailedAccessAttempts = 5;
                opt.User.RequireUniqueEmail = true;
            }).AddRoleManager<RoleManager<IdentityRole>>()
            .AddEntityFrameworkStores<ApplicationDbContext>()
            .AddDefaultTokenProviders();

            services.ConfigureApplicationCookie(opt =>
            {
                var newCookie = new CookieBuilder();
                newCookie.Name = "MinhTai";
                opt.LoginPath = new PathString("/Identity/Account/Login?ReturnUrl=%2F");
                opt.LogoutPath = new PathString("/Identity/Account/Logout?returnUrl=%2F");
                opt.Cookie = newCookie;
                opt.ExpireTimeSpan = TimeSpan.FromMinutes(60);

            });
            services.Configure<DataProtectionTokenProviderOptions>(opt =>
            {
                opt.TokenLifespan = TimeSpan.FromMinutes(10);
            });
            return services;                
        }
    }
}
