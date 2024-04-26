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
using CodeFirst.Service;

namespace CodeFirst.Controllers
{
    public class ChatPrivateController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHubContext<ChatHub> hubContext;
        private readonly CloudinaryService _cloudinaryService;


        public ChatPrivateController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, IHubContext<ChatHub> hubContext, CloudinaryService cloudinaryService)
        {
            _context = context;
            _userManager = userManager;
            this.hubContext = hubContext;
            _cloudinaryService = cloudinaryService;
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
                        c.ImageChat,
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
        public async Task<IActionResult> SendPrivateMessage(ChatPrivateViewModel model, IFormFile file)
        {
            var senderUser = await _userManager.GetUserAsync(User);
            if (ModelState.IsValid || file == null)
            {
                if (!string.IsNullOrEmpty(model.Message) && file == null || string.IsNullOrEmpty(model.Message) && file != null || !string.IsNullOrEmpty(model.Message) && file != null)
                {
                    var privateChat = new ChatPrivate
                    {
                        SenderUserId = senderUser.Id,
                        ReceiverUserId = model.ReceiverUserId, // model.ReceiverUserId là ID của người nhận
                        Message = !string.IsNullOrEmpty(model.Message) ? model.Message : "",
                        NotificationDateTime = DateTime.Now,
                    };

                    // Kiểm tra xem người nhận có tồn tại không
                    var receiverUser = await _userManager.FindByIdAsync(model.ReceiverUserId);
                    if (receiverUser == null)
                    {
                        return Json(new { success = false, message = "Người nhận không tồn tại." });
                    }
                    if (file != null)
                    {
                        var imagePath = await _cloudinaryService.UploadImageAsync(file);
                        if (imagePath != null)
                        {
                            privateChat.ImageChat = imagePath;
                        }
                    }
                    // Lưu tin nhắn riêng tư vào cơ sở dữ liệu
                    _context.ChatPrivate.Add(privateChat);
                    await _context.SaveChangesAsync();
                    // Gửi tin nhắn riêng tư đến người nhận thông qua SignalR
                    await hubContext.Clients.All.SendAsync("ReceiveChatPrivateRealtime", privateChat);

                    return Json(new { success = true, privateChat });
                }
            }
            return Json(new { success = false, errors = ModelState.Values.SelectMany(v => v.Errors) });
        }

    }
}
