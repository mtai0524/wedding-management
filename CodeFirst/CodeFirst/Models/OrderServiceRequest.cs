namespace CodeFirst.Models
{
    public class OrderServiceRequest
    {
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int ServiceId { get; set; }
    }
}
