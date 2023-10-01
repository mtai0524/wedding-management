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
            // Hiển thị spinner trước khi xử lý request chính
            context.Response.WriteAsync("<div id='loading-spinner' style='position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.8); display: flex; justify-content: center; align-items: center; z-index: 9999;'><div class='spinner-border text-primary' role='status'><span class='visually-hidden'>Loading...</span></div></div>");

            // Gọi middleware tiếp theo trong pipeline
            await _next(context);

            // Sau khi xử lý request chính, ẩn spinner
            // Chú ý: Bạn có thể kiểm tra một số điều kiện ở đây trước khi ẩn spinner
            // Ví dụ: Kiểm tra nếu response là HTML thì mới ẩn spinner
            if (context.Response.ContentType?.ToLower().Contains("text/html") == true)
            {
                // Ẩn spinner bằng cách xóa nó khỏi phản hồi
                var response = context.Response.Body;
                await response.FlushAsync();
            }
        }
    }
}
