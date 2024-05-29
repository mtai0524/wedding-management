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
    [Route("api/[controller]")]
    [ApiController]
    public class ApiBranchController : ControllerBase
    {
        private readonly IAccountRepository accountRepo;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;

        public ApiBranchController(IAccountRepository repo, UserManager<ApplicationUser> userManager, ApplicationDbContext context)
        {
            accountRepo = repo;
            _userManager = userManager;
            _context = context;
        }
        // GET: api/<ApiBranchController>

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Branch>>> GetUnlockedBranchesWithHalls()
        {
            var branches = await _context.Branch
                .Where(b => b.IsLocked == false) // Lọc các chi nhánh có IsLocked == false
                .Include(b => b.Halls)
                .ToListAsync();

            var branchDtos = branches.Select(branch => new Branch
            {
                BranchId = branch.BranchId,
                Name = branch.Name,
                Description = branch.Description,
                Image = branch.Image,
                Phone = branch.Phone,
                Address = branch.Address,
                Halls = branch.Halls.Select(hall => new Hall
                {
                    HallId = hall.HallId,
                    Name = hall.Name,
                    Description = hall.Description,
                    Image = hall.Image,
                    BranchId = hall.BranchId,
                }).ToList()
            }).ToList();

            return branchDtos;
        }


        // GET api/<ApiBranchController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ApiBranchController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ApiBranchController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ApiBranchController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
