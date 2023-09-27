using Microsoft.AspNetCore.Mvc;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
    [Route("api/menu")]
    [ApiController]
    public class ApiMenuController : ControllerBase
    {
        // GET: api/<MenuController>
        private readonly ApplicationDbContext _context;

        public ApiMenuController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var menuList = _context.MenuEntity.ToList();
            return Ok(menuList);
        }

        // GET api/<MenuController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var menuById = _context.MenuEntity.Find(id);
            if(menuById == null)
            {
                return NotFound();
            }
            return Ok(menuById);
        }

        // POST api/<MenuController>
        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] MenuEntity menu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.MenuEntity.Add(menu);
            await _context.SaveChangesAsync();

            return Ok(menu); // Trả về menu đã được lưu vào cơ sở dữ liệu (hoặc thông tin thành công khác).
        }

        // PUT api/<MenuController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<MenuController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
