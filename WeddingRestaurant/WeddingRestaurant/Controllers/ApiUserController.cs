using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WeddingRestaurant.Models;
namespace WeddingRestaurant.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiUserController : ControllerBase
    {
        RestaurantContext db = new RestaurantContext();
        [HttpGet]
        public IEnumerable<User> getAllUsers()
        {
            return db.Users.ToList();
        }
    }
}
