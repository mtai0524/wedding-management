namespace CodeFirst.Models.Entities
{
    public class FeedbackModel
    {
        public string UserId { get; set; }
        public string Content { get; set; }
        public double Rating { get; set; }
        public int BranchId { get; set; }
    }
}
