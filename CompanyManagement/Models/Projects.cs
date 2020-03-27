using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class Projects
    {
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }
        public DateTime Deadline { get; set; }
        public int BusinessUnitId { get; set; }

        public virtual BusinessUnits BusinessUnit { get; set; }
    }
}
