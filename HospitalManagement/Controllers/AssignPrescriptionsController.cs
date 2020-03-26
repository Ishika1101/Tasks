using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Controllers
{
    class AssignPrescriptionsController
    {
        public void assignPrescription()
        {
            using (var context = new HospitalManagementContext())
            {
                Console.WriteLine("Enter Patient Name:");
                string pname = Console.ReadLine();
                var p =context.Patients.Single(b => b.PatientName == pname);
                int patientid = p.PatientId;
                Console.WriteLine("Enter DoctorName:");
                string dname = Console.ReadLine();
                var d = context.Doctors.Single(b => b.DoctorName == dname);
                int doctorid = d.DoctorId;
                Console.WriteLine("Enter Prescription Disease");
                var dis=Console.ReadLine();
                var pres = context.Prescription.Single(b => b.PrescriptionDisease == dis);
                int Presid = pres.PrescriptionId;
                var assignPrescription = new AssignPrescription()
                {
                   PatientId = patientid,
                    DoctorId = doctorid,
                    PrescriptionId = Presid,

                };
                context.AssignPrescription.Add(assignPrescription);
                context.SaveChanges();
            }
        }
    }
}
