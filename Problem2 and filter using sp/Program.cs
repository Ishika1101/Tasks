using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem2
{
    class Program
    {
        static void Main(string[] args)
        {
       
            BookEntry obj = new BookEntry();
            Student stu = new Student();
            BookIssue issue = new BookIssue();
            Console.WriteLine("Enter Choice:");
            int choice=Convert.ToInt32(Console.ReadLine());
            switch(choice)
            {
                case 1: obj.enterBook();
                    break;
                case 2: obj.DeleteBook();
                    break;
                case 3:
                    stu.enterStudent();
                    break;
                case 4:
                   
                    stu.UpdateStudent();
                    break;
                case 5:

                    issue.enterBookIssue();
                    break;
                case 6:

                    issue.ViewBookIssue();
                    break;

                default: Console.WriteLine("Exit");
                    break;
            }
            
           
        }
    }
}
