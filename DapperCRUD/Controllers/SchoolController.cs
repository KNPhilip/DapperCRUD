namespace DapperCRUD.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SchoolController : ControllerBase
    {
        private readonly ISchoolService _schoolService;

        public SchoolController(ISchoolService schoolService)
        {
            _schoolService = schoolService;
        }

        [HttpGet]
        public async Task<ActionResult<ServiceResponse<List<School>>>> GetSchools()
        {
            var response = await _schoolService.GetSchoolsAsync();
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{schoolId}")]
        public async Task<ActionResult<School>> GetSchool(int schoolId)
        {
            var response = await _schoolService.GetSchoolAsync(schoolId);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpPost]
        public async Task<ActionResult<List<School>>> CreateSchool(CreateSchoolDto school)
        {
            var response = await _schoolService.CreateSchoolAsync(school);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpPut]
        public async Task<ActionResult<List<School>>> UpdateSchool(School school)
        {
            var response = await _schoolService.UpdateSchoolAsync(school);
            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpDelete("{schoolId}")]
        public async Task<ActionResult<List<School>>> DeleteSchool(int schoolId)
        {
            var response = await _schoolService.DeleteSchoolAsync(schoolId);
            return response.Success ? Ok(response) : BadRequest(response);
        }
    }
}