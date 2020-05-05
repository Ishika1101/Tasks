using Linqex.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Linqex
{
    class Program
    {
        static void Main(string[] args)
        {
            
            LinqDbContext context = new LinqDbContext();
            //2 activity
            var empdetails = from emp in context.Employee
                             select emp;
            foreach(var i in empdetails)
            {
                Console.WriteLine(i.FirstName+","+i.LastName+","+i.EmployeeId+","+i.Salary+","+i.JoiningDate+","+i.Department);

            }
            //3 activity
            
            foreach (var i in empdetails)
            {
                Console.WriteLine("FirstName:"+i.FirstName + "," +"LastName:"+ i.LastName);

            }
            //4 activity
            var empdetails2 = from emp in context.Employee
                             select new { EmployeeName=emp.FirstName };
            foreach (var i in empdetails2)
            {
                Console.WriteLine(i);

            }
            //5 activity
            Console.WriteLine("Activity 5");
            var empdetails3 = from emp in context.Employee
                              select emp.FirstName.ToUpper();
            foreach (var i in empdetails3)
            {
                Console.WriteLine(i);

            }
            //6 activity
            Console.WriteLine("Activity 6");
            var empdetails5 = from emp in context.Employee
                              select emp.FirstName.ToLower();
            foreach (var i in empdetails5)
            {
                Console.WriteLine(i);

            }
            //7 activity
            Console.WriteLine("Activity 7");
            var empdetails6 = (from emp in context.Employee
                              select emp.Department).Distinct();
                              
            foreach (var i in empdetails6)
            {
                Console.WriteLine(i);

            }
            //8 activity
            Console.WriteLine("Activity 8");
            var empdetails8 = from emp in context.Employee
                               select emp.FirstName.Substring(0,3);

            foreach (var i in empdetails8)
            {
                Console.WriteLine(i);

            }
            //9 activity
            Console.WriteLine("Activity 9");
            var empdetails9 = from emp in context.Employee
                              where emp.FirstName=="John"
                              select emp.FirstName.IndexOf("o");
            foreach (var i in empdetails9)
            {
                Console.WriteLine(i);

            }
            //10 activity
            Console.WriteLine("Activity 10");
            var empdetails10 = from emp in context.Employee
                               
                               select emp.FirstName.TrimStart();
            foreach (var i in empdetails10)
            {
                Console.WriteLine(i);

            }
            //11 activity
            Console.WriteLine("Activity 11");
            var empdetails11 = from emp in context.Employee
                            select emp.FirstName.TrimEnd();
            foreach (var i in empdetails11)
            {
                Console.WriteLine(i);

            }
            //12 activity
            Console.WriteLine("Activity 12");
            var empdetails12 = from emp in context.Employee
                               select new { FirstName = emp.FirstName, Length = emp.FirstName.Length };

            foreach (var i in empdetails12)
            {
                Console.WriteLine(i);

            }
            //13 activity
            Console.WriteLine("Activity 13");
            var empdetails13 = from emp in context.Employee
                               where emp.FirstName.Contains("o")
                               select emp.FirstName.Replace("o","$");

            foreach (var i in empdetails13)
            {
                Console.WriteLine(i);

            }
            //15 activity
            Console.WriteLine("Activity 15");
            var empdetails14 = from emp in context.Employee
                               select new {FirstName= emp.FirstName, Year=emp.JoiningDate.Year,Month=emp.JoiningDate.Month,Date=emp.JoiningDate.Date};

            foreach (var i in empdetails14)
            {
                Console.WriteLine(i);

            }
            //16 activity
            Console.WriteLine("Activity 16");
            var empdetails16 = from emp in context.Employee
                               orderby emp.FirstName ascending
                               select emp.FirstName;
            foreach (var i in empdetails16)
            {
                Console.WriteLine(i);

            }
            //17 activity
            Console.WriteLine("Activity 17");
            var empdetails17 = from emp in context.Employee
                               orderby emp.FirstName descending
                               select emp.FirstName;
            foreach (var i in empdetails17)
            {
                Console.WriteLine(i);

            }
            //18 activity
            Console.WriteLine("Activity 18");
            var empdetails18 = from emp in context.Employee
                               orderby emp.FirstName ascending,emp.Salary descending
                               select new { emp.FirstName, emp.Salary};
            foreach (var i in empdetails18)
            {
                Console.WriteLine(i);

            }
            //19 activity
            Console.WriteLine("Activity 19");
            var empdetails19 = from emp in context.Employee
                               where emp.FirstName=="John" || emp.FirstName=="Roy"
                               select emp;
            foreach (var i in empdetails19)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //20 activity
            Console.WriteLine("Activity 20");
            var empdetails20 = from emp in context.Employee
                               where emp.FirstName!="John" && emp.FirstName!= "Roy"
                               select emp;
            foreach (var i in empdetails20)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //22 activity
            Console.WriteLine("Activity 22");
            var empdetails22 = from emp in context.Employee
                               where emp.FirstName.StartsWith("J")
                               select emp;
            foreach (var i in empdetails22)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //23 activity
            Console.WriteLine("Activity 23");
            var empdetails23 = from emp in context.Employee
                               where emp.FirstName.Contains("o")
                               select emp;
            foreach (var i in empdetails23)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //24 activity
            Console.WriteLine("Activity 24");
            var empdetails24 = from emp in context.Employee
                               where emp.FirstName.EndsWith("n")
                               select emp;
            foreach (var i in empdetails24)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //25 activity
            Console.WriteLine("Activity 25");
            var empdetails25 = from emp in context.Employee
                               where emp.FirstName.EndsWith("n") && emp.FirstName.Length==4
                               select emp;
            foreach (var i in empdetails25)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //26 activity
            Console.WriteLine("Activity 26");
            var empdetails26 = from emp in context.Employee
                               where emp.FirstName.StartsWith("J") && emp.FirstName.Length==4
                               select emp;
            foreach (var i in empdetails26)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //27 activity
            Console.WriteLine("Activity 27");
            var empdetails27 = from emp in context.Employee
                               where emp.Salary>60000
                               select emp;
            foreach (var i in empdetails27)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //29 activity
            Console.WriteLine("Activity 29");
            IEnumerable<Employee> emps = context.Employee.Where<Employee>(e => e.Salary > 60000 && e.Salary<80000).Select(e => e);
                               
            foreach (var i in emps)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //30 activity
            Console.WriteLine("Activity 30");
            IEnumerable<Employee> emp1s = context.Employee.Where<Employee>(e => e.FirstName =="John" || e.FirstName == "Michael").Select(e => e);

            foreach (var i in emp1s)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //31 activity
            Console.WriteLine("Activity 31");
            IEnumerable<Employee> emp2s = context.Employee.Where<Employee>(e => e.JoiningDate.Year==2020).Select(e => e);

            foreach (var i in emp2s)
            {
                Console.WriteLine(i.FirstName + "," + i.LastName + "," + i.EmployeeId + "," + i.Salary + "," + i.JoiningDate + "," + i.Department);

            }
            //35 activity
            Console.WriteLine("Activity 35");
            var empdetails35 = from emp in context.Employee
                                select new { emp.JoiningDate.Date, emp.JoiningDate.TimeOfDay };
            foreach (var i in empdetails35)
            {
                Console.WriteLine(i);
            }
            //36 activity
            Console.WriteLine("Activity 36");
            var empdetails36 = from emp in context.Employee
                               select new { emp.JoiningDate.Date , emp.JoiningDate.TimeOfDay.Milliseconds };
            foreach (var i in empdetails36)
            {
                Console.WriteLine(i);
            }
            
            //39 activity
            Console.WriteLine("Activity 39");
            var empdetails39 = from emp in context.Employee
                               where emp.LastName.Contains("%")
                               select emp.LastName;
            foreach (var i in empdetails39)
            {
                Console.WriteLine(i);
            }
            //40 activity
            Console.WriteLine("Activity 40");
            var empdetails40 = from emp in context.Employee
                               where emp.LastName.Contains("%")
                               select emp.LastName.Replace("%","");
            foreach (var i in empdetails40)
            {
                Console.WriteLine(i);
            }
            //41 activity
            Console.WriteLine("Activity 41");
            var empdetails41 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               select new

                               {

                                   Department = newGroup.Key,

                                   Salary = newGroup.Sum(x => x.Salary)

                               };


            foreach (var depart in empdetails41)
            {
                Console.WriteLine(depart);
               
            }

            //42 activity
            Console.WriteLine("Activity 42");
            var empdetails42 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               orderby newGroup.Sum(x => x.Salary) descending
                               select new

                               {

                                   Department = newGroup.Key,

                                   Salary = newGroup.Sum(x => x.Salary)

                               };


            foreach (var depart in empdetails42)
            {
                Console.WriteLine(depart);

            }
            //43 activity
            Console.WriteLine("Activity 43");
            var empdetails43 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               orderby newGroup.Sum(x => x.Salary) descending
                               select new

                               {

                                   Department = newGroup.Key,
                                   NoOfEmployees = newGroup.Count(),
                                   Salary = newGroup.Sum(x => x.Salary)

                               };


            foreach (var depart in empdetails43)
            {
                Console.WriteLine(depart);

            }
            //44 activity
            Console.WriteLine("Activity 44");
            var empdetails44 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               orderby newGroup.Average(x => x.Salary) ascending
                               select new

                               {

                                   Department = newGroup.Key,
                                  Salary = newGroup.Average(x => x.Salary)

                               };


            foreach (var depart in empdetails44)
            {
                Console.WriteLine(depart);

            }
            //45 activity
            Console.WriteLine("Activity 45");
            var empdetails45 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               orderby newGroup.Max(x => x.Salary) ascending
                               select new

                               {

                                   Department = newGroup.Key,
                                   Salary = newGroup.Max(x => x.Salary)

                               };


            foreach (var depart in empdetails45)
            {
                Console.WriteLine(depart);

            }
            //46 activity
            Console.WriteLine("Activity 46");
            var empdetails46 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               orderby newGroup.Min(x => x.Salary) ascending
                               select new

                               {

                                   Department = newGroup.Key,
                                   Salary = newGroup.Min(x => x.Salary)

                               };


            foreach (var depart in empdetails46)
            {
                Console.WriteLine(depart);

            }
            //47 activity
            Console.WriteLine("Activity 47");
            var empdetails47 =( from emp in context.Employee
                               where emp.JoiningDate.Year == 2020 && emp.JoiningDate.Month == 2
                               select emp.EmployeeId).Count();

            Console.WriteLine(empdetails47);

            //48 activity
            Console.WriteLine("Activity 48");
            var empdetails48 = from emp in context.Employee
                               group emp by emp.Department into newGroup
                               where newGroup.Sum(x => x.Salary) > 80000
                               orderby newGroup.Sum(x => x.Salary)>80000 descending
                               select new

                               {

                                   Department = newGroup.Key,
                                   Salary = newGroup.Sum(x => x.Salary)

                               };


            foreach (var depart in empdetails48)
            {
                Console.WriteLine(depart);

            }
            //49 activity
            Console.WriteLine("Activity 49");
            var empdetails49 = from emp in context.Employee
                               join incentive in context.Incentives on emp.EmployeeId equals incentive.EmployeeId
                               where incentive.IncentiveAmount != 0
                               
                               select new

                               {

                                   Employee = emp.FirstName,
                                    IncentiveAmount = incentive.IncentiveAmount

                               };


            foreach (var depart in empdetails49)
            {
                Console.WriteLine(depart);

            }
            //50 activity
            Console.WriteLine("Activity 50");
            var empdetails50 = from emp in context.Employee
                               join incentive in context.Incentives on emp.EmployeeId equals incentive.EmployeeId
                               where incentive.IncentiveAmount != 0 && incentive.IncentiveAmount >3000

                               select new

                               {

                                   Employee = emp.FirstName,
                                   IncentiveAmount = incentive.IncentiveAmount

                               };


            foreach (var depart in empdetails50)
            {
                Console.WriteLine(depart);

            }
            //51 activity
            Console.WriteLine("Activity 51");
            var empdetails51 = (from emp in context.Employee
                                join incentive in context.Incentives on emp.EmployeeId equals incentive.EmployeeId
                                 into t
                               from rt in t.DefaultIfEmpty()
                                select new

                                {

                                    Employee =emp.FirstName,
                                    IncentiveAmount = rt.IncentiveAmount

                                }).ToList();


            foreach (var depart in empdetails51)
            {
                Console.WriteLine(depart);

            }
            //54 activity
            Console.WriteLine("Activity 54");
            var empdetails53 = (from emp in context.Employee
                                select emp.Salary).Take(2);  


            foreach (var depart in empdetails53)
            {
                Console.WriteLine(depart);

            }
            //56 activity
            Console.WriteLine("Activity 56");
            var empdetails56 = (from emp in context.Employee
                                orderby emp.Salary descending
                                select emp.Salary).Skip(1).First();


               Console.WriteLine(empdetails56);

            //57 activity
            Console.WriteLine("Activity 57\nEnter Number:");
            int num;
            num=Convert.ToInt32(Console.ReadLine());
            var empdetails57 = (from emp in context.Employee
                                orderby emp.Salary descending
                                select emp.Salary).Skip(num-1).First();
             Console.WriteLine(empdetails57);

            //59 activity
            Console.WriteLine("Activity 59");
            List<int> dataSource1 = new List<int>() { 1, 2, 3, 4, 5, 6 };
            List<int> dataSource2 = new List<int>() { 1, 3, 5, 8, 9, 10 };
            // var empdetails59 = dataSource1.Union(dataSource2);
            var empdetails59 = dataSource1.Concat(dataSource2);


            foreach (var depart in empdetails59)
            {
                Console.WriteLine(depart);

            }
            //60 activity
            Console.WriteLine("Activity 60");

            var empdetails60 = from emp in context.Employee

                               select emp;
                
            Console.WriteLine(empdetails60);



















        }
    }
}
