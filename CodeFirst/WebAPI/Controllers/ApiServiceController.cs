using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
    
    [Route("api/service")]
    [ApiController]
    public class ApiServiceController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public ApiServiceController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet("byCategoryService/{categoryId}")]
        public async Task<ActionResult<IEnumerable<ServiceEntity>>> GetMenusByCategory(int categoryId)
        {
            var services = await _context.ServiceEntity
                                      .Where(m => m.CategoryId == categoryId)
                                      .ToListAsync();
            if (services == null)
            {
                return NotFound();
            }

            return Ok(services);
        }

        [HttpGet("getCateService")]
        public async Task<ActionResult<IEnumerable<ServiceCategory>>> GetCategories()
        {
            var categories = await _context.ServiceCategory.ToListAsync();
            if (categories == null)
            {
                return NotFound();
            }

            return Ok(categories);
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync()
        {
            try
            {
                var serviceItems = await _context.ServiceEntity
                    .Include(service => service.ServiceCategory)
                    .ToListAsync();

                var result = serviceItems.Select(service => new
                {
                    ServiceId = service.ServiceId,
                    Name = service.Name,
                    Price = service.Price,
                    Description = service.Description,
                    CategoryName = service.ServiceCategory?.Name,
                    Image = service.Image
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
            var menuById = _context.ServiceEntity.Find(id);
            if (menuById == null)
            {
                return NotFound();
            }
            return Ok(menuById);
        }

        // POST api/<ApiServiceController>
        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] ServiceEntity service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.ServiceEntity.Add(service);
            await _context.SaveChangesAsync();

            return Ok(service); // Trả về menu đã được lưu vào cơ sở dữ liệu (hoặc thông tin thành công khác).
        }

        // PUT api/<ApiServiceController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ApiServiceController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
