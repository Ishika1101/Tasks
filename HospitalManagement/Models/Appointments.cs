using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Appointments
    {
        public Appointments()
        {
            AssignAssistants = new HashSet<AssignAssistants>();
        }

        public int AppointmentId { get; set; }
        public int DoctorId { get; set; }
        public string PatientName { get; set; }
        public DateTime AppointmentTime { get; set; }
        public virtual Doctors Doctor { get; set; }
        public virtual ICollection<AssignAssistants> AssignAssistants { get; set; }
    }
}
