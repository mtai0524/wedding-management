namespace CodeFirst.Models
{
    public class Menu
    {
        public int MenuId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public int DiscountId { get; set; }
    }
}
