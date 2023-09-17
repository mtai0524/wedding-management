using Microsoft.AspNetCore.Http;

namespace CodeFirst.Models
{
    public class ServiceEntity
    {
        public int ServiceId { get; set; }
        public string Name { get; set; }
        public IFormFile Image { get; set; }
    }
}
