using CodeFirst.Data;
using CodeFirst.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CodeFirst.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ManageUserController : ControllerBase
    {

        private readonly EmployeeService _employeeService;
        public ManageUserController(EmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        [HttpGet]
        public IActionResult GetEmployees()
        {
            var employees = _employeeService.GetEmployees();
            return Ok(employees);
        }
    }

}
