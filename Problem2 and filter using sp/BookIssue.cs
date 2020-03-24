using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem2
{
    class BookIssue
    {
        int bookid;
        int stuid;
        public void enterBookIssue()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            // Console.WriteLine(connectionString);
            Console.WriteLine("Enter BookName:");
            string bookname = Console.ReadLine();
            Console.WriteLine("Enter StudentName:");
            String stuname = Console.ReadLine();
            string sql = "select BookEnteryId from BookEntry where BookName=@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", bookname);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                Console.WriteLine("BookID:" + dataReader[0].ToString());
                bookid = Convert.ToInt32(dataReader[0].ToString());
            }
            dataReader.Close();
           
            string sql2 = "select StudentId from Students where StudentName=@name";
            SqlCommand command2 = new SqlCommand(sql2, connection);
            command2.Parameters.AddWithValue("name", stuname);

            SqlDataReader dataReader2 = command2.ExecuteReader();

            while (dataReader2.Read())
            {

                Console.WriteLine("StudentID:" + dataReader2[0].ToString());
                stuid = Convert.ToInt32(dataReader2[0].ToString());
            }
            dataReader2.Close();
            Console.WriteLine("Enter BookIssueDate:");
            string issue = Console.ReadLine();
            Console.WriteLine("Enter BookReturnDate:");
            string returndate = Console.ReadLine();

            

            string sql3 = $"insert into BookIssue (BookEnteryId,StudentId,BookIssueDate,BookReturnDate)values({bookid},{stuid},'{issue}','{returndate}')";
            SqlCommand command3 = new SqlCommand(sql3, connection);

            command3.ExecuteNonQuery();
            connection.Close();
        }

        public void ViewBookIssue()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=LibraryManagementDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();
            Console.WriteLine(connectionString);

            string sql = "select * from vIssueBook";
            SqlCommand command = new SqlCommand(sql, connection);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                Console.WriteLine("BookName:" + dataReader[0].ToString() + "AuthorName:" + dataReader[1].ToString()  + "StudentName:" + dataReader[2].ToString() + "BookIssueDate:" + dataReader[3].ToString()+"BookReturnDate:"+ dataReader[4].ToString());


            }
            dataReader.Close();
            connection.Close();

        }
    }
}
