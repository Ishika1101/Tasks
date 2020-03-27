using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class Employees
    {
        public Employees()
        {
            EmployeeLeave = new HashSet<EmployeeLeave>();
        }

        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        public DateTime JoiningDate { get; set; }
        public int BusinessUnitId { get; set; }

        public virtual BusinessUnits BusinessUnit { get; set; }
        public virtual ICollection<EmployeeLeave> EmployeeLeave { get; set; }
    }
}
