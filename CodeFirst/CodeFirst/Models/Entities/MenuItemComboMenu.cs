using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class MenuItemComboMenu
    {
        [Key]
        public int MenuItemComboMenuId { get; set; }

        [ForeignKey("MenuEntity")]
        public int MenuId { get; set; }
        public virtual MenuEntity? MenuEntity { get; set; }

        [ForeignKey("ComboMenuEntity")]
        public int ComboMenuId { get; set; }
        public virtual ComboMenuEntity? ComboMenuEntity { get; set; }
    }
}
