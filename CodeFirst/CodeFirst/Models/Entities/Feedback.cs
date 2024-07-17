using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodeFirst.Models.Entities
{
    public class Feedback
    {
        [Key]
        public int FeedbackId { get; set; }
        public string? UserId { get; set; } // nhớ get set dùm
        [ForeignKey("UserId")]
        public virtual ApplicationUser? User { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}", ApplyFormatInEditMode = true)]
        public DateTime? FeedbackDate { get; set; }

        public string? Content { get; set; }
        public double? Rating { get; set; }
        public int? BranchId { get; set; } // Thêm BranchId
        [ForeignKey("BranchId")]
        public virtual Branch? Branch { get; set; } // Thêm liên kết đến Branch

        public bool? isShowFeedback { get; set; }

    }
}
