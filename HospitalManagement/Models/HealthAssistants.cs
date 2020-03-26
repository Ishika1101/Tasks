using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class HealthAssistants
    {
        public HealthAssistants()
        {
            AssignAssistants = new HashSet<AssignAssistants>();
        }

        public int AssistantId { get; set; }
        public string AssistantName { get; set; }
        public int DepartmentId { get; set; }

        public virtual Departments Department { get; set; }
        public virtual ICollection<AssignAssistants> AssignAssistants { get; set; }
    }
}
