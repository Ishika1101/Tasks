using HospitalManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Controllers
{
    class AppointmentsController
    {
       
        public void AddAppointments()
        {
            using (var context = new HospitalManagementContext())
            {
                Console.WriteLine("Enter Patient Name:");
               string pname=Console.ReadLine();
                Console.WriteLine("Enter Doctor Name:");
                string dname = Console.ReadLine();
                Console.WriteLine("Enter Appointment Time:");
                string time = Console.ReadLine();
                var doctor = context.Doctors.Single(b => b.DoctorName ==dname);
                //Console.WriteLine(doctor.DoctorId);
                int doctorid = doctor.DoctorId;
               var appoint = new Appointments()
                {
                    PatientName= pname,
                    DoctorId = doctorid,
                    AppointmentTime = System.DateTime.Parse(time),
                };
                context.Appointments.Add(appoint);
                context.SaveChanges();
            }
        }
        public void getAppointments()
        {
            using (var context = new HospitalManagementContext())
            {
                
                Console.WriteLine("Enter Doctor Name:");
                string dname = Console.ReadLine();
                
                var doctor = context.Doctors.Single(b => b.DoctorName == dname);
                //Console.WriteLine(doctor.DoctorId);
                int doctorid = doctor.DoctorId;
                var appointments = context.Appointments.Count(b => b.DoctorId == doctorid);
                Console.WriteLine("Appointments:"+appointments);
            }
        }
    }
}
