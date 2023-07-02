namespace DapperCRUD.Services.SchoolService
{
    public interface ISchoolService
    {
        Task<ServiceResponse<List<School>>> GetSchoolsAsync();
        Task<ServiceResponse<School>> GetSchoolAsync(int schoolId);
        Task<ServiceResponse<IEnumerable<School>>> CreateSchoolAsync(CreateSchoolDto school);
        Task<ServiceResponse<IEnumerable<School>>> UpdateSchoolAsync(School school);
        Task<ServiceResponse<IEnumerable<School>>> DeleteSchoolAsync(int schoolId);
    }
}