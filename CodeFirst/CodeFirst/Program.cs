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
using DinkToPdf.Contracts;
using DinkToPdf;
using CodeFirst.Hubs;
using MailKit;
using CodeFirst.Areas.Services;
using Microsoft.AspNetCore.ResponseCompression;
using MudBlazor.Services;
using CodeFirst.Services;
using CodeFirst.MiddlewareExtensions;
using MudBlazor;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Components.Authorization;
using Radzen;
using Microsoft.AspNetCore.Http.Json;
using System.Text.Json;
using Newtonsoft.Json.Serialization;
//using CodeFirst.SqlDependencies;
//using SignalRYoutube.MiddlewareExtensions;


var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMudServices();
builder.Services.AddRadzenComponents();
builder.Services.AddBlazorBootstrap();

// Add services to the container.
builder.Services.AddSignalR();

var connectionString = builder.Configuration.GetConnectionString("CodeFirst");

//docker

//var dbHost = Environment.GetEnvironmentVariable("DatabaseServer") ?? "";
//var dbName = Environment.GetEnvironmentVariable("DatabaseName") ?? "";
//var dbPassword = Environment.GetEnvironmentVariable("DatabasePassword");

//var connectionString = $"Server = {dbHost},1433;Initial Catalog = {dbName}; User ID=SA;Password={dbPassword};Persist Security Info=False;Encrypt=False";


builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(connectionString);
    options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking); // fix lỗi lúc không chọn ảnh, chỉ update thong tin khác
}, ServiceLifetime.Singleton, ServiceLifetime.Transient);
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddScoped<ChatHub>(); // phải add vào mới gọi chatHub được
builder.Services.AddScoped<MyBlazorHub>(); // phải add vào mới gọi chatHub được

// đăng ký service
builder.Services.AddScoped<EmployeeService>();
builder.Services.AddScoped<GreetingService>();
builder.Services.AddScoped<UserListService>();
builder.Services.AddScoped<CloudinaryService>();
builder.Services.AddScoped<ChatService>();
builder.Services.AddScoped<AuthorizeService>();
builder.Services.AddSingleton<OnlineUserService>();
//builder.Services.AddSingleton<UserService>();

builder.Services.AddScoped<UserService>();
builder.Services.AddScoped<UserBlazorService>();
builder.Services.AddScoped<CodeFirst.Service.NotificationService>();
builder.Services.AddScoped<ProjectService>();
builder.Services.AddScoped<TaskToDoService>();
builder.Services.AddScoped<BranchService>();
builder.Services.AddHttpClient();

// Cấu hình DI scope cho ASP.NET Core SignalR

//builder.Services.AddSingleton<SubscribeNotificationTableDependency>();
builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddTransient<IEmailSender, EmailSender>(); //  dịch vụ gửi mail xác nhận đăng kí

//builder.Services.AddHangFire(config => config
//        .UseSqlServerStorage(Configuration.GetConnectionString("YourConnectionString")));
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
//builder.Services.Configure<SecurityStampValidatorOptions>(opt =>
//{
//        opt.ValidationInterval = TimeSpan.FromSeconds(10);
//});
builder.Services.AddNotyf(config =>
{
    config.DurationInSeconds = 10;
    config.IsDismissable = true;
    config.Position = NotyfPosition.BottomLeft;
});
builder.Services.AddMudServices(config =>
{
    config.SnackbarConfiguration.PositionClass = Defaults.Classes.Position.BottomLeft;

    config.SnackbarConfiguration.PreventDuplicates = false;
    config.SnackbarConfiguration.NewestOnTop = false;
    config.SnackbarConfiguration.ShowCloseIcon = true;
    config.SnackbarConfiguration.VisibleStateDuration = 10000;
    config.SnackbarConfiguration.HideTransitionDuration = 500;
    config.SnackbarConfiguration.ShowTransitionDuration = 500;
    config.SnackbarConfiguration.SnackbarVariant = MudBlazor.Variant.Outlined;
});

builder.Services.AddCors(options =>
{
    options.AddPolicy("CorsPolicy", builder =>
    {
        builder.WithOrigins("http://localhost:3000")
               .AllowAnyMethod()
               .AllowAnyHeader()
               .AllowCredentials();
    });
});

builder.Services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools())); // service cho pdf

// intergrated blazor server
builder.Services.AddServerSideBlazor().AddCircuitOptions(x => x.DetailedErrors = true);
builder.Services.AddRazorPages();
builder.Services.AddResponseCompression(options =>
{
    options.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[]
    {
        "application/octet-stream"
    });
});
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
// using signalr change data, but it make gg calendar api dont working
//builder.Services.AddControllers().AddJsonOptions(options =>
//{
//    options.JsonSerializerOptions.PropertyNamingPolicy = null;
//});

// thực hiện phân biệt các biến in hoa hoặc thường
builder.Services.AddControllers()
   .AddJsonOptions(options =>
   {
       // Apply the default naming policy for all controllers
       options.JsonSerializerOptions.PropertyNamingPolicy = null;
   })
  ;

//builder.Services.Configure<Microsoft.AspNetCore.Http.Json.JsonOptions>(options =>
//{
//    options.SerializerOptions.PropertyNameCaseInsensitive = false;
//    options.SerializerOptions.PropertyNamingPolicy = null;
//    options.SerializerOptions.WriteIndented = true;
//});
// Session
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession();
builder.Services.AddControllersWithViews();

builder.Services.AddTransient<ApplicationDbContext>();




var app = builder.Build();

// Configure the HTTP request pipeline.

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
//app.UseMiddleware<SecurityStampCheck>();

app.UseCors("CorsPolicy");
app.MapHub<ChatHub>("/chatHub");
app.MapHub<MyBlazorHub>("/myBlazorHub");

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
//app.UseSqlTableDependency<SubscribeNotificationTableDependency>(connectionString);

//app.UseMiddleware<LoadingSpinnerMiddleware>();
app.UseResponseCompression();
app.MapRazorPages();
app.MapBlazorHub();
app.MapFallbackToController("Blazor", "Home");
app.UseSession();
app.Run();
