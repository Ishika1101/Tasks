using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Prescription
    {
        public Prescription()
        {
            AssignPrescription = new HashSet<AssignPrescription>();
        }

        public int PrescriptionId { get; set; }
        public string PrescriptionDisease { get; set; }
        public string Morning { get; set; }
        public string Afternoon { get; set; }
        public string Night { get; set; }

        public virtual ICollection<AssignPrescription> AssignPrescription { get; set; }
    }
}
