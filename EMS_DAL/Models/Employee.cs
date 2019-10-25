using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS_DAL.Models
{
    public class Employee
    {
        public int Number { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public int DepartmentNo { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime DateOfJoining { get; set; }
        public int ReportingTo { get; set; }
        public long Phone { get; set; }
        public int Salary { get; set; }
        public int Commission { get; set; }
        public string JobTitle { get; set; }
    }
}
