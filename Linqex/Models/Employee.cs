using System;
using System.Collections.Generic;

namespace Linqex.Models
{
    public partial class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Salary { get; set; }
        public DateTime JoiningDate { get; set; }
        public string Department { get; set; }
    }
}
