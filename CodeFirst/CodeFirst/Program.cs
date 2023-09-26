using CodeFirst.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using CodeFirst.Models;
using CodeFirst.Service;
using CloudinaryDotNet;
using System.Configuration;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Identity.UI.Services;
using AspNetCoreHero.ToastNotification;
using System;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//options.UseSqlServer(builder.Configuration.GetConnectionString("CodeFirst")));

builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("CodeFirst"));
    options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking); // fix lỗi lúc không chọn ảnh, chỉ update thong tin khác
});

// đăng ký service
builder.Services.AddScoped<EmployeeService>();
builder.Services.AddScoped<CloudinaryService>();

builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();


//builder.Services.AddDefaultIdentity<IdentityUser>()
//    .AddDefaultTokenProviders()
//    .AddRoles<IdentityRole>()
//    .AddEntityFrameworkStores<ApplicationDbContext>();

// thay đổi razor cshtml runtime F5
builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();

// Cấu hình tài khoản Cloudinary
var configuration = builder.Configuration;

var cloudName = configuration["Cloudinary:CloudName"];
var apiKey = configuration["Cloudinary:ApiKey"];
var apiSecret = configuration["Cloudinary:ApiSecret"];

var cloudinaryAccount = new Account(cloudName, apiKey, apiSecret);
var cloudinary = new Cloudinary(cloudinaryAccount);

builder.Services.AddSingleton(cloudinary);

builder.Services.AddAuthentication()
.AddFacebook(facebookOptions =>
{
    facebookOptions.AppId = configuration["Authentication:Facebook:AppId"];
    facebookOptions.AppSecret = configuration["Authentication:Facebook:AppSecret"];
    facebookOptions.CallbackPath = "/signin-facebook";
})
.AddGoogle(googleOptions =>
{
    googleOptions.ClientId = configuration["Authentication:Google:ClientId"];
    googleOptions.ClientSecret = configuration["Authentication:Google:ClientSecret"];
});

//builder.Services.AddAuthentication().AddFacebook(option =>
//{
//    option.AppId = "1016279636383657";
//    option.AppSecret = "14661687021dceb69eee4ea69fd64dc9";
//    option.AccessDeniedPath = "/AccessDeniedPathInfo";
//});


builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequiredLength = 6; // Điều chỉnh độ dài mật khẩu tối thiểu
    options.Password.RequireLowercase = true; // Yêu cầu ký tự thường
    options.Password.RequireUppercase = true; // Yêu cầu ký tự hoa
    options.Password.RequireDigit = true; // Yêu cầu chứa ít nhất một số
    options.Password.RequireNonAlphanumeric = true; // Yêu cầu ký tự đặc biệt
    options.SignIn.RequireConfirmedEmail = true; // Yêu cầu xác nhận email trước khi đặt lại mật khẩu
});
builder.Services.Configure<IdentityOptions>(options =>
{
    // Cấu hình khoáng thời gian và số lần thử lại
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30);
    options.Lockout.MaxFailedAccessAttempts = 5;
    options.Lockout.AllowedForNewUsers = true;

    // Cấu hình đặc điểm gửi email
    options.SignIn.RequireConfirmedEmail = true;
    options.User.RequireUniqueEmail = true;
});

builder.Services.AddNotyf(config =>
{
    config.DurationInSeconds = 10;
    config.IsDismissable = true;
    config.Position = NotyfPosition.TopRight;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();


app.MapRazorPages();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
      name: "areas",
      pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
    );
    endpoints.MapControllerRoute(
     name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
    );
});

app.Run();
