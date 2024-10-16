using Microsoft.AspNetCore.Identity.UI.Services;
using System.Net;
using System.Net.Mail;

namespace CodeFirst.Areas.Services
{
    public class EmailSender : IEmailSender
    {
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            var from = "duatreodaiduongden@gmail.com";
            var message = new MailMessage();
            message.From = new MailAddress(from);
            message.Subject = subject;
            message.To.Add(email);
            message.Body = $"<html><body>{htmlMessage}</body></html>";
            message.IsBodyHtml = true;

            // Gửi đến Mailtrap
            SmtpClient smtpMailtrap = new SmtpClient("sandbox.smtp.mailtrap.io");
            smtpMailtrap.EnableSsl = true;
            smtpMailtrap.Port = 2525;
            smtpMailtrap.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpMailtrap.Credentials = new NetworkCredential("f53ec0c5d129dd", "647d8437d3d40c");

            // Gửi đến Gmail
            SmtpClient smtpGmail = new SmtpClient("smtp.gmail.com");
            smtpGmail.EnableSsl = true;
            smtpGmail.Port = 587;
            smtpGmail.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpGmail.Credentials = new NetworkCredential("duatreodaiduongden@gmail.com", "aiyt kzuj xpbq ygda");

            // Gửi email đến cả hai SMTP server cùng lúc
            var sendMailtrapTask = smtpMailtrap.SendMailAsync(message);
            var sendGmailTask = smtpGmail.SendMailAsync(message);

            // Chờ cả hai tác vụ hoàn thành
            await Task.WhenAll(sendMailtrapTask, sendGmailTask);
        }
    }
}
