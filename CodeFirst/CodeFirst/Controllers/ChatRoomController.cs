using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using CodeFirst.ViewModels;
using Microsoft.AspNetCore.SignalR;
using CodeFirst.Hubs;

namespace CodeFirst.Controllers
{
    public class ChatRoomController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IHubContext<ChatHub> _hubContext;

        public ChatRoomController(ApplicationDbContext context, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }
        [HttpGet]
        public async Task<IActionResult> GetChatRooms()
        {
            var chatRooms = await _context.ChatRooms.ToListAsync();
            return Ok(chatRooms);
        }
        [HttpPost]
        public async Task<IActionResult> DeleteChatRoomAsync(int chatRoomId)
        {
            var deleteChatRoomById = _context.ChatRooms.FirstOrDefault(x => x.Id == chatRoomId);
            if (deleteChatRoomById != null)
            {
                _context.ChatRooms.Remove(deleteChatRoomById);
                _context.SaveChanges();
                await _hubContext.Clients.All.SendAsync("GetChatRoomSignalR", chatRoomId);

                return Ok(new { success = true });
            }
            else
            {
                return BadRequest(new { success = false, error = "Chat room not found" });
            }
        }
        [HttpPost]
        public async Task<IActionResult> UpdateChatRoomAsync(int chatRoomId, string chatRoomNameToUpdate)
        {
            try
            {
                var chatRoom = _context.ChatRooms.FirstOrDefault(x => x.Id == chatRoomId);

                if (chatRoom == null)
                {
                    return NotFound();
                }

                chatRoom.Name = chatRoomNameToUpdate;
                _context.Update(chatRoom);
                _context.SaveChanges();
                await _hubContext.Clients.All.SendAsync("GetChatRoomSignalR", chatRoomId);

                return Ok(new { success = true });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateRoom([FromBody] ChatRoomViewModel chatRoomViewModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var chatRoom = new ChatRoom
            {
                Name = chatRoomViewModel.Name
            };

            _context.ChatRooms.Add(chatRoom);
            await _context.SaveChangesAsync();
            await _hubContext.Clients.All.SendAsync("GetChatRoomSignalR", chatRoom);


            return Json(new { success = true, chatRoom });
        }
        // GET: ChatRoom
        public async Task<IActionResult> Index()
        {
            return _context.ChatRooms != null ?
                        View(await _context.ChatRooms.ToListAsync()) :
                        Problem("Entity set 'ApplicationDbContext.ChatRooms'  is null.");
        }

        // GET: ChatRoom/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ChatRooms == null)
            {
                return NotFound();
            }

            var chatRoom = await _context.ChatRooms
                .FirstOrDefaultAsync(m => m.Id == id);
            if (chatRoom == null)
            {
                return NotFound();
            }

            return View(chatRoom);
        }

        // GET: ChatRoom/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ChatRoom/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name")] ChatRoom chatRoom)
        {
            if (ModelState.IsValid)
            {
                _context.Add(chatRoom);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(chatRoom);
        }

        // GET: ChatRoom/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ChatRooms == null)
            {
                return NotFound();
            }

            var chatRoom = await _context.ChatRooms.FindAsync(id);
            if (chatRoom == null)
            {
                return NotFound();
            }
            return View(chatRoom);
        }

        // POST: ChatRoom/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name")] ChatRoom chatRoom)
        {
            if (id != chatRoom.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chatRoom);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChatRoomExists(chatRoom.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(chatRoom);
        }

        // GET: ChatRoom/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ChatRooms == null)
            {
                return NotFound();
            }

            var chatRoom = await _context.ChatRooms
                .FirstOrDefaultAsync(m => m.Id == id);
            if (chatRoom == null)
            {
                return NotFound();
            }

            return View(chatRoom);
        }

        // POST: ChatRoom/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ChatRooms == null)
            {
                return Problem("Entity set 'ApplicationDbContext.ChatRooms'  is null.");
            }
            var chatRoom = await _context.ChatRooms.FindAsync(id);
            if (chatRoom != null)
            {
                _context.ChatRooms.Remove(chatRoom);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ChatRoomExists(int id)
        {
            return (_context.ChatRooms?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
