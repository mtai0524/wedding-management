namespace CodeFirst.Models
{
    public class PaginatedList<T>
    {
        public List<T> Items { get; set; }
        public int PageIndex { get; set; }
        public int TotalItems { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }

    }
}
