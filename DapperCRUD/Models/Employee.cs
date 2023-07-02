namespace DapperCRUD.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string FullName => FirstName + " " + LastName;
        public string NickName { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Mail { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public int SchoolId { get; set; }
        public bool IsEmployee { get; set; }
        public DateTime BirthDate { get; set; }
        public DateTime DateHired { get; set; }
        public DateTime DateLastUpdated { get; set; }
        public DateTime DateDismissed { get; set; }
    }
}