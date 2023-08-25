using Microsoft.AspNetCore.Mvc;

namespace WeddingRestaurant.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
	}
}
