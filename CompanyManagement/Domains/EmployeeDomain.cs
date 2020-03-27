using CompanyManagement.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
namespace CompanyManagement.Domains
{
    class EmployeeDomain:CompanyDbContext
    {
       
        Employees emp = new Employees();
        public void addEmployees()
        {     using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Add Employee Details:");
                Console.Write("Enter Employee_Name:");
                emp.EmployeeName = Console.ReadLine();
                Console.Write("Enter Address:");
                emp.Address = Console.ReadLine();
                Console.Write("Enter MobileNo:");
                emp.MobileNo = Console.ReadLine();
                Console.Write("Enter Email:");
                emp.Email = Console.ReadLine();
                Console.Write("Enter Joining_Date:");
                emp.JoiningDate = System.DateTime.Parse(Console.ReadLine());
                Console.Write("Enter BusinessUnit_Name:");
                string bname = Console.ReadLine();
                var obj = context.BusinessUnits.Single(t => t.UnitName == bname);
                emp.BusinessUnitId = obj.BusinessUnitId;
                Employees.Add(emp);
                SaveChanges();
            }
        }
        public void deleteEmployees()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Delete Employee:");
                Console.Write("Enter Employee_Name:");
               string name = Console.ReadLine();
                var b = context.Employees.Single(t => t.EmployeeName == name);
               emp.EmployeeId = b.EmployeeId;
                Employees.Remove(emp);
                SaveChanges();
            }
        }
        public void updateEmployees()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Update Employee:");
                Console.Write("Enter Employee_Name:");
                
               

                try
               {
                    string name = Console.ReadLine();
                    var b = context.Employees.Single(t => t.EmployeeName == name);
                   emp.EmployeeId= b.EmployeeId;
                    emp.EmployeeName = b.EmployeeName;
                    Console.Write("Enter Address:");
                    emp.Address = Console.ReadLine();
                    Console.Write("Enter MobileNo:");
                    emp.MobileNo = Console.ReadLine();
                    Console.Write("Enter Email:");
                    emp.Email = Console.ReadLine();
                    emp.JoiningDate= b.JoiningDate;
                    emp.BusinessUnitId = b.BusinessUnitId; ;

                     Employees.Update(emp);
                     SaveChanges();
                }
                catch
                {
                    Console.WriteLine("Employee Don't exist");
                    throw new ArgumentException("Employee Don't exist");
                }
            }
        }
    }
}
