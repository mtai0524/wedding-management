using AspNetCoreHero.ToastNotification.Abstractions;
using CodeFirst.Models;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Calendar.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using CodeFirst.Helpers;

namespace CodeFirst.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [Authorize]
        public IActionResult Index()
        {
            return View("_Host");
        }

        public IActionResult Blazor()
        {
            return View("_Host");
        }

        public IActionResult Privacy()
        {
            return View();
        }
        //public async Task<IActionResult> PrivacyAsync()
        //{
        //    IList<Event> events = await GetGoogleCalendarEvents();
        //    return View(events);
        //}

        public async Task<IActionResult> GetCalendar()
        {
            IList<Event> events = await GetGoogleCalendarEvents();
            var googleCalendarEvents = events.Select(e => new GoogleCalendar
            {
                Summary = e.Summary,
                Description = e.Description,
                Location = e.Location,
                Start = e.Start.DateTime.Value, // Assuming Start is a DateTime object
                End = e.End.DateTime.Value, // Assuming End is a DateTime object
                ColorId = e.ColorId, // Assuming ColorId is a string
                Id = e.Id // Assuming Id is a string
            }).ToList();

            return Json(googleCalendarEvents);
        }

        [HttpPost]
        public async Task<IActionResult> CreateGoogleCalendar(GoogleCalendar request)
        {
            var createdEvent = await GoogleCalendarHelper.CreateGoogleCalendar(request);

            return Ok(createdEvent);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateEventColor(string eventId, string colorId, string summary, string location, string des)
        {
            string[] Scopes = { CalendarService.Scope.Calendar };
            string ApplicationName = "Google Calendar API";

            UserCredential credential;
            using (var stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), "Cre", "cre.json"), FileMode.Open, FileAccess.Read))
            {
                string credPath = "token.json";
                credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true));
            }

            // Create the calendar service
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });

            // Retrieve the existing event
            EventsResource.GetRequest getRequest = service.Events.Get("primary", eventId);
            Event existingEvent = await getRequest.ExecuteAsync();

            // Update the color of the event
            existingEvent.ColorId = colorId;
            existingEvent.Summary = summary;
            existingEvent.Location = location;
            existingEvent.Description = des;
            // Update the event on Google Calendar
            EventsResource.UpdateRequest updateRequest = service.Events.Update(existingEvent, "primary", eventId);
            Event updatedGoogleEvent = await updateRequest.ExecuteAsync();

            return Ok(updatedGoogleEvent);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateEvent(string eventId, GoogleCalendar updatedEvent)
        {
            string[] Scopes = { CalendarService.Scope.Calendar };
            string ApplicationName = "Google Calendar API";

            UserCredential credential;
            using (var stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), "Cre", "cre.json"), FileMode.Open, FileAccess.Read))
            {
                string credPath = "token.json";
                credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true));
            }

            // Create the calendar service
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });

            // Retrieve the existing event
            EventsResource.GetRequest getRequest = service.Events.Get("primary", eventId);
            Event existingEvent = await getRequest.ExecuteAsync();

            // Update the event with the new information
            existingEvent.Summary = updatedEvent.Summary;
            existingEvent.Start = new EventDateTime
            {
                DateTime = updatedEvent.Start,
                TimeZone = "Asia/Ho_Chi_Minh"
            };
            existingEvent.End = new EventDateTime
            {
                DateTime = updatedEvent.End,
                TimeZone = "Asia/Ho_Chi_Minh"
            };


            // Update the event on Google Calendar
            EventsResource.UpdateRequest updateRequest = service.Events.Update(existingEvent, "primary", eventId);
            Event updatedGoogleEvent = await updateRequest.ExecuteAsync();

            return Ok(updatedGoogleEvent);
        }

        public async Task<IList<Event>> GetGoogleCalendarEvents()
        {
            string[] Scopes = { "https://www.googleapis.com/auth/calendar.readonly" };
            string ApplicationName = "Google Calendar API";

            UserCredential credential;
            using (var stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), "Cre", "cre.json"), FileMode.Open, FileAccess.Read))
            {
                string credPath = "token.json";
                credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true));
            }

            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });

            // Define parameters for the request
            EventsResource.ListRequest request = service.Events.List("primary");
            request.TimeMin = DateTime.Now;
            request.ShowDeleted = false;
            request.SingleEvents = true;
            request.MaxResults = 2000;
            request.OrderBy = EventsResource.ListRequest.OrderByEnum.StartTime;

            // Retrieve the events
            Events events = await request.ExecuteAsync();
            IList<Event> items = events.Items;
            return items;
        }
        [HttpPost]
        public async Task<IActionResult> DeleteEvent(string eventId)
        {
            string[] Scopes = { CalendarService.Scope.Calendar };
            string ApplicationName = "Google Calendar API";

            try
            {
                UserCredential credential;
                using (var stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), "Cre", "cre.json"), FileMode.Open, FileAccess.Read))
                {
                    string credPath = "token.json";
                    credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
                        GoogleClientSecrets.Load(stream).Secrets,
                        Scopes,
                        "user",
                        CancellationToken.None,
                        new FileDataStore(credPath, true));
                }

                // Create the calendar service
                var service = new CalendarService(new BaseClientService.Initializer()
                {
                    HttpClientInitializer = credential,
                    ApplicationName = ApplicationName,
                });

                // Gọi API của Google Calendar để xóa sự kiện
                await service.Events.Delete("primary", eventId).ExecuteAsync();

                return Ok("Event deleted successfully.");
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                return StatusCode(500, "Error deleting event: " + ex.Message);
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}