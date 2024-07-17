namespace CodeFirst.Models
{
    public class OrderMenuRequest
    {
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int MenuID { get; set; }
    }
}
