using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class EmployeeLeave
    {
        public int LeaveId { get; set; }
        public int EmployeeId { get; set; }
        public string LeaveType { get; set; }
        public DateTime LeaveFrom { get; set; }
        public DateTime LeaveTo { get; set; }

        public virtual Employees Employee { get; set; }
    }
}
