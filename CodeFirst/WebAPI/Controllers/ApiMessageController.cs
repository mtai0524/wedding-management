using AutoMapper;
using CodeFirst.Chat.Entities;
using CodeFirst.Chat.Model;
using CodeFirst.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiMessageController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;
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

            var messages = _context.Message.Where(m => m.ToRoomId == room.Id)
                .Include(m => m.FromUser)
                .Include(m => m.ToRoom)
                .OrderByDescending(m => m.Timestamp)
                .Take(20)
                .AsEnumerable()
                .Reverse()
                .ToList();

            var messagesViewModel = _mapper.Map<IEnumerable<Message>, IEnumerable<MessageViewModel>>(messages);

            return Ok(messagesViewModel);
        }

        //[HttpPost]
        //public async Task<ActionResult<Message>> Create(MessageViewModel messageViewModel)
        //{
        //    var user = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
        //    var room = _context.Rooms.FirstOrDefault(r => r.Name == messageViewModel.Room);
        //    if (room == null)
        //        return BadRequest();

        //    var msg = new Message()
        //    {
        //        Content = Regex.Replace(messageViewModel.Content, @"<.*?>", string.Empty),
        //        FromUser = user,
        //        ToRoom = room,
        //        Timestamp = DateTime.Now
        //    };

        //    _context.Message.Add(msg);
        //    await _context.SaveChangesAsync();

        //    // Broadcast the message
        //    var createdMessage = _mapper.Map<Message, MessageViewModel>(msg);
        //    await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", createdMessage);

        //    return CreatedAtAction(nameof(Get), new { id = msg.Id }, createdMessage);
        //}


        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var message = await _context.Message
                .Include(u => u.FromUser)
                .Where(m => m.Id == id && m.FromUser.UserName == User.Identity.Name)
                .FirstOrDefaultAsync();

            if (message == null)
                return NotFound();

            _context.Message.Remove(message);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
