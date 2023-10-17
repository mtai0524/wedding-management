namespace CodeFirst.Models.Entities
{
    public class BranchWithFeedbackViewModel
    {
        public Branch Branch { get; set; } // Đối tượng chi nhánh
        public List<Feedback> FeedbackList { get; set; } // Danh sách phản hồi
        
    }
}
