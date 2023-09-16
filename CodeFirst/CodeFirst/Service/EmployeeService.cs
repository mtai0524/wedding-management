using CodeFirst.Data;
using CodeFirst.Models;

namespace CodeFirst.Service
{
    public class EmployeeService
    {
        private readonly ApplicationDbContext _context;
        public EmployeeService(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<EmployeeEntity> GetEmployees()
        {
            return _context.Employee.ToList();
        }
    }
}
