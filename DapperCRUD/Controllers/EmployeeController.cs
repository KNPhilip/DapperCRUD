namespace DapperCRUD.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;

        public EmployeeController(IEmployeeService emplyoeeService)
        {
            _employeeService = emplyoeeService;
        }

        [HttpGet]
        public async Task<ActionResult<ServiceResponse<List<Employee>>>> GetEmployees()
        {
            var response = await _employeeService.GetEmployeesAsync();
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{employeeId}")]
        public async Task<ActionResult<Employee>> GetEmployee(int employeeId)
        {
            var response = await _employeeService.GetEmployeeAsync(employeeId);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpPost]
        public async Task<ActionResult<List<Employee>>> CreateEmployee(CreateEmployeeDto employee)
        {
            var response = await _employeeService.CreateEmployeeAsync(employee);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpPut]
        public async Task<ActionResult<List<Employee>>> UpdateEmployee(Employee employee)
        {
            var response = await _employeeService.UpdateEmployeeAsync(employee);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpDelete("{employeeId}")]
        public async Task<ActionResult<List<Employee>>> DeleteEmployee(int employeeId)
        {
            var response = await _employeeService.DeleteEmployeeAsync(employeeId);
            return response.Success ? Ok(response) : BadRequest(response);
        }
    }
}