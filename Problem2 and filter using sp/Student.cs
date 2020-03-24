using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem2
{
    class Student
    {

        public void enterStudent()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.WriteLine("Enter StudentName:");
            string name = Console.ReadLine();
            Console.WriteLine("Enter MobileNo:");
            string mobileno = Console.ReadLine();
            Console.WriteLine("Enter Email:");
            string email = Console.ReadLine();
            Console.WriteLine("Enter City:");
            string city = Console.ReadLine();
            Console.WriteLine("Enter Qualification:");
            string qual = Console.ReadLine();



            string sql = $"insert into Students (StudentName,MobileNo,Email,City,Qualification)values('{name}','{mobileno}','{email}','{city}','{qual}')";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdateStudent()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);
            Console.WriteLine("Enter StudentId:");
            int stuid = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter MobileNo:");
            string mobile = Console.ReadLine();
            string sql ="update Students Set MobileNo =@number where StudentId =@id" ;

            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("number",mobile);
            command.Parameters.AddWithValue("id", stuid);



            command.ExecuteNonQuery();
            connection.Close();
        }
    }

}
