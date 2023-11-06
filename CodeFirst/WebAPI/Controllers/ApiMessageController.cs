using AutoMapper;
using CodeFirst.Data;
using CodeFirst.Models.Chat;
using CodeFirst.Models.Chat.ChatModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/message")]
    [ApiController]
    public class ApiMessageController : ControllerBase
    {
        public readonly ApplicationDbContext _context;
        public readonly IMapper _mapper;

        public ApiMessageController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> Get(int id)
        {
            var message = await _context.Message.FindAsync(id);
            if (message == null)
                return NotFound();

            var messageViewModel = _mapper.Map<Message, MessageViewModel>(message);
            return Ok(messageViewModel);
        }
    }
}
