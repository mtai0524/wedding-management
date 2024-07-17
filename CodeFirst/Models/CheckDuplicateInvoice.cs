namespace CodeFirst.Models
{
    public class CheckDuplicateInvoice
    {
        public DateTime AttendanceDate { get; set; }
        public int BranchId { get; set; }
        public int HallId { get; set; }
        public string? TimeHall { get; set; }
    }
}
