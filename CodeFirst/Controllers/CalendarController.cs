using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Calendar.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CodeFirst.Helpers;
using CodeFirst.Models;

namespace CodeFirst.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CalendarController : ControllerBase
    {
       

        //[HttpGet]
        //public async Task<IActionResult> GetGoogleCalendarEventsApi()
        //{
        //    // Gọi hàm để lấy dữ liệu từ Google Calendar
        //    IList<Event> events = await GetGoogleCalendarEvents();

        //    // Trả về dữ liệu dưới dạng JSON
        //    return Ok(events);
        //}




        //public async Task<IList<Event>> GetGoogleCalendarEvents()
        //{
        //    string[] Scopes = { "https://www.googleapis.com/auth/calendar.readonly" };
        //    string ApplicationName = "Google Calendar API";

        //    UserCredential credential;
        //    using (var stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), "Cre", "cre.json"), FileMode.Open, FileAccess.Read))
        //    {
        //        string credPath = "token.json";
        //        credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
        //            GoogleClientSecrets.Load(stream).Secrets,
        //            Scopes,
        //            "user",
        //            CancellationToken.None,
        //            new FileDataStore(credPath, true));
        //    }

        //    var service = new CalendarService(new BaseClientService.Initializer()
        //    {
        //        HttpClientInitializer = credential,
        //        ApplicationName = ApplicationName,
        //    });

        //    // Define parameters for the request
        //    EventsResource.ListRequest request = service.Events.List("primary");
        //    request.TimeMin = DateTime.Now;
        //    request.ShowDeleted = false;
        //    request.SingleEvents = true;
        //    request.MaxResults = 10;
        //    request.OrderBy = EventsResource.ListRequest.OrderByEnum.StartTime;

        //    // Retrieve the events
        //    Events events = await request.ExecuteAsync();
        //    IList<Event> items = events.Items;
        //    return items;
        //}

    }
}
