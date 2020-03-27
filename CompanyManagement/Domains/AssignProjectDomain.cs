using CompanyManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CompanyManagement.Domains
{
    class AssignProjectDomain:CompanyDbContext
    {
        AssignProjects assign = new AssignProjects();
        public void assignProject()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Assign Projects:");
                Console.Write("Enter Employee_Name:");
                string name = Console.ReadLine();
                var b = context.Employees.Single(t => t.EmployeeName == name);
               
                int count=context.EmployeeLeave.Count(t => t.EmployeeId == b.EmployeeId);
                if (count == 0)
                {
                    assign.EmployeeId = b.EmployeeId;
                    Console.Write("Enter ProjectName:");
                    string pname = Console.ReadLine();
                    var p = context.Projects.Single(t => t.ProjectName == pname);
                    assign.ProjectId = p.ProjectId;
                    AssignProjects.Add(assign);
                    SaveChanges();
                }
                else
                {
                    Console.Write("Employee is on leave");
                }
            }
        }
    }
}
