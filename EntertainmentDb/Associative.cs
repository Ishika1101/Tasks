using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntertainmentDb
{

    class Associative
    {
        string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=EntertainmentDb;Integrated Security=true;MultipleActiveResultSets=True;";
        int movieid, actorid;
        public void CastActors() {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            Console.WriteLine("Enter MovieName:");
            string moviename = Console.ReadLine();
            Console.WriteLine("Enter ActorName:");
            String actorname = Console.ReadLine();
            string sql = "select MovieId from Movies where MovieName=@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", moviename);
            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                Console.WriteLine("MovieId:" + dataReader[0].ToString());
                movieid = Convert.ToInt32(dataReader[0].ToString());
            }
            dataReader.Close();

            string sql2 = "select ActorId from Actors where ActorName=@name";
            SqlCommand command2 = new SqlCommand(sql2, connection);
            command2.Parameters.AddWithValue("name", actorname);

            SqlDataReader dataReader2 = command2.ExecuteReader();

            while (dataReader2.Read())
            {

                Console.WriteLine("ActorId:" + dataReader2[0].ToString());
                actorid = Convert.ToInt32(dataReader2[0].ToString());
            }
            dataReader2.Close();

            try
            {

                string sql3 = $"insert into Associative (MovieId,ActorId)values({movieid},{actorid})";
                SqlCommand command3 = new SqlCommand(sql3, connection);

                command3.ExecuteNonQuery();
            }
            catch(Exception e)
            {
                throw new ArgumentException("ActorName or MovieName doesn't exist");
            }
            connection.Close();
        }
    
        public void ViewCastActors()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            Console.Write("Enter MovieName:");
           string movie = Console.ReadLine();
            string sql = "select ActorName from vRelation where MovieName=@moviename";
             SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("moviename", movie);
            SqlDataReader dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
                Console.WriteLine( "ActorName:" + dataReader[0].ToString() );
            }
                dataReader.Close();
            connection.Close();
        }
}
}
