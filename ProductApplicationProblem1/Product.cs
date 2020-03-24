using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductApplication
{
   public class Product
    {
       //Problem 1 task
        public Product()
        {

            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=ProductDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();
            Console.WriteLine(connectionString);

            string sql = "select * from Products";
            SqlCommand command = new SqlCommand(sql, connection);

            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                Console.WriteLine("Product ID:"+dataReader[0].ToString() + "Product Name:"+dataReader[1].ToString() + "Product Type:"+dataReader[2].ToString() + "Product Quantity:"+dataReader[3].ToString() + "Product Price:"+dataReader[4].ToString() );


            }
            dataReader.Close();
            connection.Close();
        }
        public void insertdata()
        {
            string connectionString = "Data Source=ISHIKAGANGWAL;Initial Catalog=ProductDb;Integrated Security=true;MultipleActiveResultSets=True;";

            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();
            Console.WriteLine("Enter ProductName:");
            string name = Console.ReadLine();
            Console.WriteLine("Enter ProductType:");
            string type = Console.ReadLine();
            Console.WriteLine("Enter ProductQuantity:");
            int quan = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter ProductPrice:");
            int price = Convert.ToInt32( Console.ReadLine());


            string sql = $"insert into Products (ProductName,ProductType,ProductQuantity,ProductPrice)values('{name}','{type}',{quan},{price})";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
        }

        

          



    }

}
