using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;

namespace CodeFirst.Controllers
{
    public class ChatPrivateController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ChatPrivateController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<IActionResult> GetPrivateMessages(string senderUserId, string receiverUserId)
        {
            try
            {
                // Lấy tất cả tin nhắn riêng tư giữa hai người dùng với các điều kiện là senderUserId và receiverUserId
                var privateMessages = await _context.ChatPrivate
                    .Where(c => (c.SenderUserId == senderUserId && c.ReceiverUserId == receiverUserId) ||
                                (c.SenderUserId == receiverUserId && c.ReceiverUserId == senderUserId))
                    .OrderBy(c => c.NotificationDateTime)
                    .Select(c => new
                    {
                        c.ChatPrivateId,
                        c.SenderUserId,
                        c.ReceiverUserId,
                        c.Message,
                        NotificationDateTime = c.NotificationDateTime.ToString("HH:mm dd/MM/yyyy"),
                        SenderUser = new
                        {
                            c.SenderUser.Email,
                            c.SenderUser.Avatar,
                            c.SenderUser.FirstName,
                            c.SenderUser.LastName
                        },
                        ReceiverUser = new
                        {
                            c.ReceiverUser.Email,
                            c.ReceiverUser.Avatar,
                            c.ReceiverUser.FirstName,
                            c.ReceiverUser.LastName
                        }
                    })
                    .ToListAsync();

                return Ok(privateMessages);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }



        // GET: ChatPrivate
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.ChatPrivate.Include(c => c.ReceiverUser).Include(c => c.SenderUser);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: ChatPrivate/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ChatPrivate == null)
            {
                return NotFound();
            }

            var chatPrivate = await _context.ChatPrivate
                .Include(c => c.ReceiverUser)
                .Include(c => c.SenderUser)
                .FirstOrDefaultAsync(m => m.ChatPrivateId == id);
            if (chatPrivate == null)
            {
                return NotFound();
            }

            return View(chatPrivate);
        }

        // GET: ChatPrivate/Create
        public IActionResult Create()
        {
            ViewData["ReceiverUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id");
            ViewData["SenderUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id");
            return View();
        }

        // POST: ChatPrivate/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ChatPrivateId,SenderUserId,ReceiverUserId,Message,NotificationDateTime")] ChatPrivate chatPrivate)
        {
            if (ModelState.IsValid)
            {
                _context.Add(chatPrivate);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ReceiverUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.ReceiverUserId);
            ViewData["SenderUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.SenderUserId);
            return View(chatPrivate);
        }

        // GET: ChatPrivate/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ChatPrivate == null)
            {
                return NotFound();
            }

            var chatPrivate = await _context.ChatPrivate.FindAsync(id);
            if (chatPrivate == null)
            {
                return NotFound();
            }
            ViewData["ReceiverUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.ReceiverUserId);
            ViewData["SenderUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.SenderUserId);
            return View(chatPrivate);
        }

        // POST: ChatPrivate/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ChatPrivateId,SenderUserId,ReceiverUserId,Message,NotificationDateTime")] ChatPrivate chatPrivate)
        {
            if (id != chatPrivate.ChatPrivateId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chatPrivate);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChatPrivateExists(chatPrivate.ChatPrivateId))
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
            ViewData["ReceiverUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.ReceiverUserId);
            ViewData["SenderUserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", chatPrivate.SenderUserId);
            return View(chatPrivate);
        }

        // GET: ChatPrivate/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ChatPrivate == null)
            {
                return NotFound();
            }

            var chatPrivate = await _context.ChatPrivate
                .Include(c => c.ReceiverUser)
                .Include(c => c.SenderUser)
                .FirstOrDefaultAsync(m => m.ChatPrivateId == id);
            if (chatPrivate == null)
            {
                return NotFound();
            }

            return View(chatPrivate);
        }

        // POST: ChatPrivate/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ChatPrivate == null)
            {
                return Problem("Entity set 'ApplicationDbContext.ChatPrivate'  is null.");
            }
            var chatPrivate = await _context.ChatPrivate.FindAsync(id);
            if (chatPrivate != null)
            {
                _context.ChatPrivate.Remove(chatPrivate);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ChatPrivateExists(int id)
        {
          return (_context.ChatPrivate?.Any(e => e.ChatPrivateId == id)).GetValueOrDefault();
        }
    }
}
