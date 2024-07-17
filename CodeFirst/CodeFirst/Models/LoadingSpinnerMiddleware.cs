namespace CodeFirst.Models
{
    public class LoadingSpinnerMiddleware
    {
        private readonly RequestDelegate _next;
        public LoadingSpinnerMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task InvokeAsync(HttpContext context)
        {
            context.Response.WriteAsync("<div id='loading-spinner' style='position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.8); display: flex; justify-content: center; align-items: center; z-index: 9999;'><div class='spinner-border text-primary' role='status'><span class='visually-hidden'>Loading...</span></div></div>");

            await _next(context);

            if (context.Response.ContentType?.ToLower().Contains("text/html") == true)
            {
                var response = context.Response.Body;
                await response.FlushAsync();
            }
        }
    }
}
