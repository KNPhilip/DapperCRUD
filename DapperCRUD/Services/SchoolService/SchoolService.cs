using Dapper;

namespace DapperCRUD.Services.SchoolService
{
    public class SchoolService : ISchoolService
    {
        private readonly IConfiguration _config;

        public SchoolService(IConfiguration config)
        {
            _config = config;
        }

        public async Task<ServiceResponse<List<School>>> GetSchoolsAsync()
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                IEnumerable<School> schools = await SelectSchoolsAsync(connection);

                var results = new ServiceResponse<List<School>>
                {
                    Data = schools.ToList()
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<List<School>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<School>> GetSchoolAsync(int schoolId)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                var school = await connection.QueryFirstAsync<School>($"SELECT * FROM Schools WHERE Id = @Id",
                    new { Id = schoolId });

                var results = new ServiceResponse<School>
                {
                    Data = school
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<School>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<School>>> CreateSchoolAsync(CreateSchoolDto school)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("INSERT INTO Schools " +
                    "(Name, Website, Facebook, DepartmentManagerId, IsDeleted, Latitude, Longitude) VALUES " +
                    "(@Name, @Website, @Facebook, @DepartmentManagerId, @IsDeleted, @Latitude, @Longitude)", school);

                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Data = await SelectSchoolsAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<School>>> UpdateSchoolAsync(School school)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("UPDATE Schools SET " +
                    "Name = @Name, Website = @Website, Facebook = @Facebook, DepartmentManagerId = @DepartmentManagerId, IsDeleted = @IsDeleted, Latitude = @Latitude, Longitude = @Longitude WHERE Id = @Id", school);

                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Data = await SelectSchoolsAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        public async Task<ServiceResponse<IEnumerable<School>>> DeleteSchoolAsync(int schoolId)
        {
            try
            {
                using var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
                await connection.ExecuteAsync("DELETE FROM Schools WHERE Id = @Id", new { Id = schoolId });

                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Data = await SelectSchoolsAsync(connection)
                };

                return results;
            }
            catch (Exception e)
            {
                var results = new ServiceResponse<IEnumerable<School>>
                {
                    Success = false,
                    Message = $"Something went wrong: {e.Message}"
                };

                return results;
            }
        }

        private static async Task<IEnumerable<School>> SelectSchoolsAsync(SqlConnection connection)
        {
            return await connection.QueryAsync<School>("SELECT * FROM Schools");
        }
    }
}