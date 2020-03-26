using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Patients
    {
        public Patients()
        {
            AssignPrescription = new HashSet<AssignPrescription>();
        }

        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public string Address { get; set; }
        public string ContactNo { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }

        public int AppointmentId { get; set; }
        public virtual Appointments Appointment { get; set; }
        public virtual ICollection<AssignPrescription> AssignPrescription { get; set; }
    }
}
