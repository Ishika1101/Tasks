using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Controllers
{
    class AssignAssistantController
    {
        public void assignAssistant()
        {
            using (var context = new HospitalManagementContext())
            {
                Console.WriteLine("Enter Patient Name:");
                string pname = Console.ReadLine();
                var appoint = context.Appointments.Single(b => b.PatientName == pname);
                int appointid = appoint.AppointmentId;
                Console.WriteLine("Enter AssistantName:");
                string assist = Console.ReadLine();
                var assistant = context.HealthAssistants.Single(b => b.AssistantName == assist);
                int assistid = assistant.AssistantId;
                var assignAssistants = new AssignAssistants()
                {
                    AssistantId=assistid,
                    AppointmentId = appointid,

                };
                context.AssignAssistants.Add(assignAssistants);
                context.SaveChanges();
            }
        }
    }
}


