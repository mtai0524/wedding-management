using CodeFirst.Data;
using CodeFirst.Models;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Repositories;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
    [Route("api/hall")]
    [ApiController]
    public class ApiHallController : ControllerBase
    {
        private readonly IAccountRepository accountRepo;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;

        public ApiHallController(IAccountRepository repo, UserManager<ApplicationUser> userManager, ApplicationDbContext context)
        {
            accountRepo = repo;
            _userManager = userManager;
            _context = context;
        }

        // GET: api/<ApiHallController>

        [HttpGet]
        public IActionResult GetAllHalls()
        {
            // Lấy danh sách tất cả các Hall kèm theo thông tin Name của Branch
            var halls = _context.Hall
                .Select(hall => new
                {
                    hall.HallId,
                    hall.Name,
                    hall.Description,
                    hall.Image,
                    hall.Price,
                    hall.Capacity,
                    BranchName = hall.Branch != null ? hall.Branch.Name : null // Lấy tên của Branch hoặc null nếu không có Branch
                })
                .ToList();

            return Ok(halls); // Trả về danh sách thông tin Hall và BranchName
        }

      

        // GET api/<ApiHallController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ApiHallController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ApiHallController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ApiHallController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
