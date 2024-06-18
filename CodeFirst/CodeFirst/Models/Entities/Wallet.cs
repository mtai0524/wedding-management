using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    [Table("Wallet")]
    public class Wallet
    {
        [Key]
        public int WalletId { get; set; }
        public string? UserId { get; set; } 
        [ForeignKey("UserId")]
        public virtual ApplicationUser? User { get; set; }
        public double? Coin { get; set; }
    }
}
