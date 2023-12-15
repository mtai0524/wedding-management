using Microsoft.AspNetCore.Identity.UI.Services;
using System.Net;
using System.Net.Mail;

namespace CodeFirst.Areas.Services
{
    public class EmailSender : IEmailSender
    {
        public async Task SendEmailAsync(string email, string subject, string htmlMessage) // thêm async thì không cần return :))
        {
            var from = "duatreodaiduongden@gmail.com";
            //var pass = "aiyt kzuj xpbq ygda";
            var message = new MailMessage();
            message.From = new MailAddress(from);
            message.Subject = subject;
            message.To.Add(email);
            message.Body = $"<html><body>{htmlMessage}</body></html>";
            message.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("sandbox.smtp.mailtrap.io");
            smtp.EnableSsl = true;
            smtp.Port = 2525;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("f53ec0c5d129dd", "647d8437d3d40c");
            smtp.Send(message);
        }
    }
}
