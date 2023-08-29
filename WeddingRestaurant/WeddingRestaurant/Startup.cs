using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using dotenv.net;
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
        private static void ConfigureServices(WebApplicationBuilder builder) {
            builder.Services.AddControllersWithViews();

            // Cấu hình tài khoản Cloudinary
            Account cloudinaryAccount = new Account(
                "dl3hvap4a",
                "834354428788744",
                "lv7zI6VPru0YhHwUPQsru318SOE");

            Cloudinary cloudinary = new Cloudinary(cloudinaryAccount);

            builder.Services.AddSingleton(cloudinary);
            builder.Services.AddSignalR();
        }

        private static void Configure(WebApplication app)
        {
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<MyHub>("/myhub");
                // ... other endpoints ...
            });
        }
    }
}
