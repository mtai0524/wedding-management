using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CodeFirst.Models
{
    public class UserViewModel
    {
        public string Id { get; set; }
        public string UserName { get; set; }

        public string? SelectedRole { get; set; }
        [ValidateNever]
        public IEnumerable<SelectListItem> Roles { get; set; } // Role khi submit sẽ không validate

    }
}
