using DataEmptyCore;
using DataEmptyCore.Models.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ProjectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiUserController : ControllerBase
    {
        private readonly ILogger<ApiUserController> _logger;
        private RestaurantContext db = new RestaurantContext();
        public ApiUserController(ILogger<ApiUserController> logger)
        {
            _logger = logger;
        }
        [HttpGet(Name = "GetUser")]
        public IEnumerable<User> Get()
        {
            var listUser = db.Users.ToList();
            return listUser;
        }
        //[HttpGet]
        //public IActionResult Get() {
        //    return Ok();
        //}
    }
}
