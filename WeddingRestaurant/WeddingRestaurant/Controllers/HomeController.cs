using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using DataEmptyCore;
using DataEmptyCore.Models.Entities;
using WeddingRestaurant.Models;

namespace WeddingRestaurant.Controllers
{
	public class HomeController : Controller
    {
        RestaurantContext db = new RestaurantContext();


        private readonly ILogger<HomeController> _logger;
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;

        }

        public IActionResult Index()
        {
            var listUser = db.Users.ToList();
            return View(listUser);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        async public Task<IActionResult> API()
        {
            HttpClient client = new HttpClient();
            var data = await client.GetAsync("https://localhost:7271/WeatherForecast");
            var res = await data.Content.ReadAsStringAsync();
            var dataJson = JsonConvert.DeserializeObject<IEnumerable<WeatherForecast>>(res);
            return View(dataJson);
        }
    }
}