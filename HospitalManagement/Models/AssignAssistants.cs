using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class AssignAssistants
    {
        public int AssignAssistantId { get; set; }
        public int AppointmentId { get; set; }
        public int AssistantId { get; set; }

        public virtual Appointments Appointment { get; set; }
        public virtual HealthAssistants Assistant { get; set; }
    }
}
