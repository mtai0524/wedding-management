using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using CodeFirst.Models;
using CodeFirst.ViewModels;
using CodeFirst.Hubs;

namespace CodeFirst.Controllers
{
    public class ChatPrivateController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHubContext<ChatHub> hubContext;

        public ChatPrivateController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _userManager = userManager;
            this.hubContext = hubContext;
        }
        [HttpGet]
        public async Task<IActionResult> GetPrivateMessages(string senderUserId, string receiverUserId)
        {
            try
            {
                var currentUser = await _userManager.GetUserAsync(User);
                string emailUserCurr = User.Identity.Name ?? "DefaultEmail@example.com";
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
                        UserNameCurrent = emailUserCurr,
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

        [HttpPost]
        public async Task<IActionResult> SendPrivateMessage(ChatPrivateViewModel model)
        {
            var senderUser = await _userManager.GetUserAsync(User);
            if (ModelState.IsValid)
            {
                var privateChat = new ChatPrivate
                {
                    SenderUserId = senderUser.Id,
                    ReceiverUserId = model.ReceiverUserId, // Giả sử model.ReceiverUserId là ID của người nhận
                    Message = model.Message,
                    NotificationDateTime = DateTime.Now,
                };

                // Kiểm tra xem người nhận có tồn tại không
                var receiverUser = await _userManager.FindByIdAsync(model.ReceiverUserId);
                if (receiverUser == null)
                {
                    return Json(new { success = false, message = "Người nhận không tồn tại." });
                }

                // Lưu tin nhắn riêng tư vào cơ sở dữ liệu
                _context.ChatPrivate.Add(privateChat);
                await _context.SaveChangesAsync();
                // Gửi tin nhắn riêng tư đến người nhận thông qua SignalR
                await hubContext.Clients.All.SendAsync("ReceiveChatPrivateRealtime", privateChat);

                return Json(new { success = true, privateChat });
            }

            return Json(new { success = false, errors = ModelState.Values.SelectMany(v => v.Errors) });
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
