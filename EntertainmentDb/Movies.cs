using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntertainmentDb
{
    class Movies
    {
        string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=EntertainmentDb;Integrated Security=true;MultipleActiveResultSets=True;";

        public void AddMovies()
        {
            //string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

           
            Console.WriteLine("Enter MovieName:");
            string name = Console.ReadLine();
            Console.WriteLine("Enter MovieType:");
            string type = Console.ReadLine();
            
            Console.WriteLine("Enter Language:");
            string lang = Console.ReadLine();
            Console.WriteLine("Enter MovieRating:");
           int rating = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter MovieReleaseDate:");
            string release = Console.ReadLine();
            Console.WriteLine("Enter DirectorName:");
            string director = Console.ReadLine();


            string sql = $"insert into Movies (MovieName,MovieType,MovieLanguage,MovieRating,MovieReleaseYear,DirectorName)values('{name}','{type}','{lang}',{rating},'{release}','{director}')";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteMovie()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.WriteLine("Enter MovieName:");
            // int id = Convert.ToInt32(Console.ReadLine());

            string moviename=Console.ReadLine();

            string sql = "delete from Movies where MovieName =@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", moviename);


            command.ExecuteNonQuery();
            connection.Close();
        }

    }

}
