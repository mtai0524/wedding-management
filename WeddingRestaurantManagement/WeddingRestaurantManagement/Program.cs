using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using WeddingRestaurantManagement.Data;
using WeddingRestaurantManagement.Models;

var builder = WebApplication.CreateBuilder(args);

// cấu hình để identity
var connectionString = builder.Configuration.GetConnectionString("WeddingRestaurantManagementContextConnection") ?? throw new InvalidOperationException("Connection string 'WeddingRestaurantManagementContextConnection' not found.");

builder.Services.AddDbContext<WeddingRestaurantManagementContext>(options =>
    options.UseSqlServer(connectionString));

// thêm vào để controller Scaffolded RestaurantContext
builder.Services.AddDbContext<RestaurantContext>(options =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("WeddingRestaurantManagementContextConnection"))); // để controller hiểu kết nối mặc định 

builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<WeddingRestaurantManagementContext>();



// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.MapRazorPages(); // để Url show đúng view razor

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
