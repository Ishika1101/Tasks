using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntertainmentDb
{
    class Actors
    {
        string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=EntertainmentDb;Integrated Security=true;MultipleActiveResultSets=True;";

        public void AddActors()
        {
            //string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();


            Console.WriteLine("Enter ActorName:");
            string name = Console.ReadLine();
            Console.WriteLine("Enter ActorLanguage:");
            string lang = Console.ReadLine();
            Console.WriteLine("Enter Gender:");
            string gender = Console.ReadLine();
            Console.WriteLine("Enter DateOfBirth:");
            string dob = Console.ReadLine();
            


            string sql = $"insert into Actors (ActorName,ActorLanguage,Gender,DateOfBirth)values('{name}','{lang}','{gender}','{dob}')";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteActors()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.WriteLine("Enter ActorName:");
            // int id = Convert.ToInt32(Console.ReadLine());

            string actorname = Console.ReadLine();

            string sql = "delete from Actors where ActorName =@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", actorname);


            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}
