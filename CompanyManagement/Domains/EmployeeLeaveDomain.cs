using CompanyManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CompanyManagement.Domains
{
    class EmployeeLeaveDomain:CompanyDbContext
    {
        EmployeeLeave leave = new EmployeeLeave();
        public void addLeave()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Add Employee Leaves:");
                Console.Write("Enter Employee_Name:");
                string name = Console.ReadLine();
                var b = context.Employees.Single(t => t.EmployeeName == name);
                leave.EmployeeId = b.EmployeeId;
                Console.Write("Enter LeaveType:");
                leave.LeaveType = Console.ReadLine();
                Console.Write("Enter LeaveFrom:");
                leave.LeaveFrom = System.DateTime.Parse(Console.ReadLine());
                Console.Write("Enter LeaveTo:");
                leave.LeaveTo = System.DateTime.Parse(Console.ReadLine());
                EmployeeLeave.Add(leave);
                SaveChanges();
            }
        }
        public void deleteLeave()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Delete EmployeeLeave:");
                Console.Write("Enter Employee_Name:");
                string name = Console.ReadLine();
                var b = context.Employees.Single(t => t.EmployeeName == name);
                leave.EmployeeId = b.EmployeeId;
                var l = context.EmployeeLeave.Single(t => t.EmployeeId == leave.EmployeeId);
                leave.LeaveId = l.LeaveId;
                EmployeeLeave.Remove(leave);
                SaveChanges();
            }
        }
    }
}
