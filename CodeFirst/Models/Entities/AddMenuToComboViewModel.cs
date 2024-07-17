using Microsoft.AspNetCore.Mvc;

namespace CodeFirst.Models.Entities
{
    public class AddMenuToComboViewModel
    {
        [BindProperty]
        public int ComboMenuId { get; set; }

        [BindProperty]
        public List<int> SelectedMenuIds { get; set; }
    }
}
