using Microsoft.AspNetCore.Mvc;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;
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
        [HttpGet("getCate")]
        public async Task<ActionResult<IEnumerable<MenuCategory>>> GetCategories()
        {
            var categories = await _context.MenuCategory.ToListAsync();
            if (categories == null)
            {
                return NotFound();
            }

            return Ok(categories);
        }

        [HttpGet("byCategory/{categoryId}")]
        public async Task<ActionResult<IEnumerable<MenuEntity>>> GetMenusByCategory(int categoryId)
        {
            var menus = await _context.MenuEntity
                                      .Where(m => m.CategoryId == categoryId)
                                      .ToListAsync();
            if (menus == null)
            {
                return NotFound();
            }

            return Ok(menus);
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync()
        {
            try
            {
                var menuItems = await _context.MenuEntity
                    .Include(menu => menu.MenuCategory) // Include MenuCategory
                    .ToListAsync();

                // Map the result to a DTO if needed to shape the response
                var result = menuItems.Select(menu => new
                {
                    MenuId = menu.MenuId,
                    Name = menu.Name,
                    Price = menu.Price,
                    Description = menu.Description,
                    CategoryName = menu.MenuCategory?.Name, // Get the name from MenuCategory
                    Image = menu.Image
                });

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
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
