using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class AssignPrescription
    {
        public int AssignPrescription1 { get; set; }
        public int PatientId { get; set; }
        public int PrescriptionId { get; set; }
        public int DoctorId { get; set; }

        public virtual Doctors Doctor { get; set; }
        public virtual Patients Patient { get; set; }
        public virtual Prescription Prescription { get; set; }
    }
}
