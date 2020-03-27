using CompanyManagement.Domains;
using System;

namespace CompanyManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            
            
            int choice;
            EmployeeDomain emp = new EmployeeDomain();
            BusinessUnitDomain unit = new BusinessUnitDomain();
            EmployeeLeaveDomain leave = new EmployeeLeaveDomain();
            AssignProjectDomain assign = new AssignProjectDomain();
            ProjectDomain project = new ProjectDomain();
            do
            {
                Console.WriteLine("Enter Choice:");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        emp.addEmployees();
                        break;
                    case 2:
                        emp.deleteEmployees();
                        break;
                    case 3:
                        emp.updateEmployees();
                        break;
                    case 4:
                        unit.addUnits();
                        break;
                    case 5:
                        unit.updateUnits();
                        break;
                    case 6:
                        project.addProjects();
                        break;
                    case 7:
                        leave.addLeave();
                        break;
                    case 8:
                        leave.deleteLeave();
                        break;
                    case 9:
                        assign.assignProject();
                        break;
                    default:
                        Console.WriteLine("Exit");
                        break;
                }
            } while (choice != 10);
        }
    }
}
