using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Departments
    {
        public Departments()
        {
            Doctors = new HashSet<Doctors>();
            HealthAssistants = new HashSet<HealthAssistants>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string DepartmentDetails { get; set; }

        public virtual ICollection<Doctors> Doctors { get; set; }
        public virtual ICollection<HealthAssistants> HealthAssistants { get; set; }
    }
}
