using HospitalManagement.Controllers;
using System;

namespace HospitalManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice;
            AppointmentsController a = new AppointmentsController();
            PatientsController p = new PatientsController();
            AssignAssistantController assign = new AssignAssistantController();
            AssignPrescriptionsController prescribe = new AssignPrescriptionsController();
            do
            {
                Console.WriteLine("Enter Choice:");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.WriteLine("Add Appointment");
                        a.AddAppointments();
                        break;
                    case 2:
                        Console.WriteLine("Add Patients");
                        p.AddPatients();
                        break;
                    case 3:
                        Console.WriteLine("Assign Assistants");
                        assign.assignAssistant();
                        break;
                    case 4:
                        Console.WriteLine("Assign Prescriptions");
                        prescribe.assignPrescription();
                        break;
                    case 5:Console.WriteLine("GetAppointment List");
                        a.getAppointments();
                        break;
                    default:
                        Console.WriteLine("Exit");
                        break;
                }
            } while (choice != 4);
        }
    }
}
