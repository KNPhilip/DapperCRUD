namespace DapperCRUD.Dtos
{
    public class CreateSchoolDto
    {
        public string Name { get; set; } = string.Empty;
        public string Website { get; set; } = string.Empty;
        public string Facebook { get; set; } = string.Empty;
        public int DepartmentManagerId { get; set; }
        public bool IsDeleted { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}