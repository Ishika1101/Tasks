using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem2
{
    class BookEntry
    {
        public int BookEntryId { get; set; }
       
        public void enterBook()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.WriteLine("Enter BookTitle:");
            string title = Console.ReadLine();
            Console.WriteLine("Enter BookName:");
            string name = Console.ReadLine();
            Console.WriteLine("Enter Copies:");
            int copies = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter AuthorName:");
            string author = Console.ReadLine();


            string sql = $"insert into BookEntry (BookTitle,BookName,Copies,AuthorName)values('{title}','{name}',{copies},'{author}')";
            SqlCommand command = new SqlCommand(sql,connection);

            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteBook()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.WriteLine("Enter BookName:");
            int id = Convert.ToInt32(Console.ReadLine());



            string sql = "delete from BookEntry where BookEnteryId ="+id;
            SqlCommand command = new SqlCommand(sql, connection);

            
            
            command.ExecuteNonQuery();
            connection.Close();
        }



    }
}
