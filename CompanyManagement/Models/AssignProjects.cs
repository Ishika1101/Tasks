using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class AssignProjects
    {
        public int AssignProjectId { get; set; }
        public int EmployeeId { get; set; }
        public int ProjectId { get; set; }
    }
}
