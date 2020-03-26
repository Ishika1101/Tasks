using System;
using System.Collections.Generic;
using System.Text;
using ToyFactory.Models;
using System.Linq;
namespace ToyFactory.Controllers
{
    class OrderController
    {
        public void addOrder()
        {
            int i = 1;
            double Price = 0;
            using (var context = new ToyFactoryDbContext())
            {
                //Place Order
                Console.WriteLine("Place_Order:-");
                DateTime localDate = DateTime.Now;
                Console.Write("Enter CustomerName:");
                string fname = Console.ReadLine();
                var obj = context.Customers.Single(t => t.FirstName == fname);
                int customerid = obj.CustomerId;
                Console.Write("Enter OrderQuantity:");
                byte quan = Convert.ToByte(Console.ReadLine());
                try
                {
                    var order = new Orders()
                    {
                        OrderDate = localDate,
                        OrderQuantity = quan,
                        CustomerId = customerid,

                    };
                    context.Orders.Add(order);
                    context.SaveChanges();
                }catch(Exception e)
                {
                    Console.WriteLine("Customer Already Placed Order");
                    throw new ArgumentException(e.ToString()); 
                }
                //Enter Order Details
                while (i <= quan)
                {
                    Console.Write("Enter ToyName:");
                    string tname = Console.ReadLine();

                    var obj1 = context.Toys.Single(t => t.ToyName == tname);
                    int tid = obj1.ToyId;
                    Price += obj1.ToyPrice;
                    Console.Write("Enter Address:");
                    string address = Console.ReadLine();
                    var obj2 = context.ShippingAddress.Single(t => t.ShippingAddress1 == address);
                    int aid = obj2.AddressId;
                    var obj3 = context.Orders.Single(t => t.CustomerId == customerid);
                    int oid = obj3.OrderId;

                    var orderDetails = new OrderDetails()
                    {
                        OrderId = oid,
                        AddressId = aid,
                        ToyId = tid,

                    };

                    context.OrderDetails.Add(orderDetails);
                    context.SaveChanges();
                    i++;
                }
                // Console.WriteLine(Price);
                /*Schemes Given By company*/
                if (Price > 500)
                {
                    Console.WriteLine("Get Discount Of 50%");
                    double discount = Price * 50 / 100;
                    double newprice = Price - discount;
                    Console.WriteLine("After Discount Price:"+newprice);
                    Console.WriteLine("Order Placed Successfully");
                }
                else if(quan>=4)
                {
                    Console.WriteLine("Get One Toy Free");
                    Console.WriteLine("Order Placed Successfully");
                }
                else
                {
                    Console.WriteLine("Order Placed Successfully");
                }
            }
         
        }
    }
}
