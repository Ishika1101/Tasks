using CompanyManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CompanyManagement.Domains
{
    class ProjectDomain:CompanyDbContext
    {
        Projects project = new Projects();
        public void addProjects()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Add Projects:");
                Console.Write("Enter Project_Name:");
                 project.ProjectName = Console.ReadLine();
                Console.Write("Enter DeadLine:");
                project.Deadline = System.DateTime.Parse(Console.ReadLine());
                Console.Write("Enter BusinessUnitName:");
                string bname = Console.ReadLine();
                var obj = context.BusinessUnits.Single(t => t.UnitName == bname);
                project.BusinessUnitId = obj.BusinessUnitId;
                Projects.Add(project);
                SaveChanges();
            }
        }
    }
}
