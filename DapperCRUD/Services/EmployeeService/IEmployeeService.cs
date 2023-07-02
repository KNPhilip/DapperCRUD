namespace DapperCRUD.Services.EmployeeService
{
    public interface IEmployeeService
    {
        Task<ServiceResponse<List<Employee>>> GetEmployeesAsync();
        Task<ServiceResponse<Employee>> GetEmployeeAsync(int employeeId);
        Task<ServiceResponse<IEnumerable<Employee>>> CreateEmployeeAsync(CreateEmployeeDto employee);
        Task<ServiceResponse<IEnumerable<Employee>>> UpdateEmployeeAsync(Employee employee);
        Task<ServiceResponse<IEnumerable<Employee>>> DeleteEmployeeAsync(int employeeId);
    }
}