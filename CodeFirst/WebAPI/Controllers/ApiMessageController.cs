using AutoMapper;
using CodeFirst.Data;
using CodeFirst.Models.Chat;
using CodeFirst.Models.Chat.ChatModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
        [HttpGet("Room/{roomName}")]
        public IActionResult GetMessages(string roomName)
        {
            var room = _context.Room.FirstOrDefault(r => r.Name == roomName);
            if (room == null)
                return BadRequest();

            var messages = _context.Message
                .Include(m => m.ApplicationUser) // Kết hợp navigation property User
                .Include(m => m.Room) // Kết hợp navigation property Room
                .Where(m => m.RoomId == room.RoomId)
                .OrderByDescending(m => m.Timestamp)
                .Take(20)
                .ToList();

            var messagesViewModel = _mapper.Map<IEnumerable<Message>, IEnumerable<MessageViewModel>>(messages);

            return Ok(messagesViewModel);
        }

    }
}
