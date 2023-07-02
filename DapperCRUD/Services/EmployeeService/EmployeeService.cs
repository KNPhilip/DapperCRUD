using Dapper;

namespace DapperCRUD.Services.EmployeeService
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IConfiguration _config;

        public EmployeeService(IConfiguration config)
        {
            _config = config;
        }

        public async Task<ServiceResponse<List<Employee>>> GetEmployeesAsync()
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                IEnumerable<Employee> employees = await SelectEmployeesAsync(connection);

                var results = new ServiceResponse<List<Employee>>
                {
                    Data = employees.ToList()
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<List<Employee>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<Employee>> GetEmployeeAsync(int employeeId)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                var employee = await connection.QueryFirstAsync<Employee>($"SELECT * FROM Employees WHERE Id = @Id",
                    new { Id = employeeId });

                var results = new ServiceResponse<Employee>
                {
                    Data = employee
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<Employee>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<Employee>>> CreateEmployeeAsync(CreateEmployeeDto employee)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("INSERT INTO Employees " +
                    "(FirstName, LastName, NickName, Title, Mail, Phone, SchoolId, IsEmployee, BirthDate, DateHired) VALUES " +
                    "(@FirstName, @LastName, @NickName, @Title, @Mail, @Phone, @SchoolId, @IsEmployee, @BirthDate, @DateHired)", employee);

                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Data = await SelectEmployeesAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<Employee>>> UpdateEmployeeAsync(Employee employee)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("UPDATE Employees SET " +
                    "FirstName = @FirstName, LastName = @LastName, NickName = @NickName, Title = @Title, Mail = @Mail, Phone = @Phone, SchoolId = @SchoolId, IsEmployee = @IsEmployee, BirthDate = @BirthDate, DateHired = @DateHired, DateLastUpdated = @DateLastUpdated, DateDismissed = @DateDismissed WHERE Id = @Id", employee);

                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Data = await SelectEmployeesAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<Employee>>> DeleteEmployeeAsync(int employeeId)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("DELETE FROM Employees WHERE Id = @Id", new { Id = employeeId });

                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Data = await SelectEmployeesAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<Employee>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        private static async Task<IEnumerable<Employee>> SelectEmployeesAsync(SqlConnection connection)
        {
            return await connection.QueryAsync<Employee>("SELECT * FROM Employees");
        }
    }
}