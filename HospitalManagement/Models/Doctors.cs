using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Doctors
    {
        public Doctors()
        {
            AssignPrescription = new HashSet<AssignPrescription>();
        }

        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string Specialization { get; set; }
        public string ContactNo { get; set; }
        public string Gender { get; set; }
        public int DepartmentId { get; set; }

        public virtual Departments Department { get; set; }
        public virtual ICollection<AssignPrescription> AssignPrescription { get; set; }
    }
}
