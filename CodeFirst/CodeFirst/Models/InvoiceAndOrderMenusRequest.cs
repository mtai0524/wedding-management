namespace CodeFirst.Models
{
    public class InvoiceAndOrderMenusRequest
    {
        public string? UserId { get; set; }
        public List<OrderMenuRequest> OrderMenus { get; set; }
    }
}
