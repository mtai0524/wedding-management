//using CloudinaryDotNet;
//using CloudinaryDotNet.Actions;
//using dotenv.net;
using Microsoft.EntityFrameworkCore;
//using WeddingRestaurant.Models;
using Microsoft.Extensions.Configuration;
using System.Text.Encodings.Web;
using System.Text.Unicode;

namespace WeddingRestaurant
{
    public class Startup
    {
        public static WebApplication InitializeApp(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            ConfigureServices(builder);
            var app = builder.Build();
            Configure(app);
            return app;
        }
        private static void ConfigureServices(WebApplicationBuilder builder)
        {
            builder.Services.AddControllersWithViews();

            // Cấu hình tài khoản Cloudinary
            //Account cloudinaryAccount = new Account(
            //    "dl3hvap4a",
            //    "834354428788744",
            //    "lv7zI6VPru0YhHwUPQsru318SOE");

            //Cloudinary cloudinary = new Cloudinary(cloudinaryAccount);

            //builder.Services.AddSingleton(cloudinary);
            builder.Services.AddSignalR();

            //builder.Services.AddDbContext<RestaurantContext>(options =>
            //options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))); // để controller hiểu kết nối mặc định 
            //builder.Services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] {UnicodeRanges.All}));

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("AllowReactApp",
                    builder =>
                    {
                        builder.WithOrigins("http://localhost:3000")
                               .AllowAnyHeader()
                               .AllowAnyMethod();
                    });
            });

            //builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
        }

        private static void Configure(WebApplication app)
        {
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseCors("AllowReactApp");

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                  name: "areas",
                  pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
                );
                endpoints.MapControllerRoute(
                name: "default",
                 //pattern: "{controller=User}/{action=Login}");
                 pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
