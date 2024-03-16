using Microsoft.AspNetCore.Mvc;

namespace CodeFirst.Controllers
{
    public class ChatController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
