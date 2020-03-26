using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Controllers
{
    class PatientsController
    {
        public void AddPatients()
        {
            using (var context = new HospitalManagementContext())
            {
                Console.WriteLine("Enter Patient Name:");
                string pname = Console.ReadLine();
                Console.WriteLine("Enter Address:");
                string address = Console.ReadLine();
                Console.WriteLine("Enter ContactNo:");
                string contact = Console.ReadLine();
                Console.WriteLine("Enter Gender:");
                string gender = Console.ReadLine();
                Console.WriteLine("Enter Age:");
                int age = Convert.ToInt32(Console.ReadLine());
                try
                {
                    var appoint = context.Appointments.Single(b => b.PatientName == pname);
                    //Console.WriteLine(doctor.DoctorId);
                    int aid = appoint.AppointmentId;



                    var Patient = new Patients()
                    {
                        PatientName = pname,
                        Address = address,
                        ContactNo = contact,
                        Gender = gender,
                        Age = age,
                        AppointmentId = aid,

                    };


                    context.Patients.Add(Patient);
                   } catch (Exception e)
                {
                    Console.WriteLine("Patient DontTake any Appointment");
                    throw new ArgumentException("Patient DontTake any Appointment");
                   
                }
                context.SaveChanges();
            }
        }
    }
}