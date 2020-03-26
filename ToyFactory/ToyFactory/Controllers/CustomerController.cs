using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ToyFactory.Models;

namespace ToyFactory.Controllers
{
    class CustomerController
    {
        public void addCustomers()
        {
            using (var context =new ToyFactoryDbContext())
            {
                Console.WriteLine("Add Customer:-");
                Console.Write("Enter FirstName:");
                string fname = Console.ReadLine();
                Console.Write("Enter LastName:");
                string lname = Console.ReadLine();
                Console.Write("Enter ContactNo:");
                string contactNo=Console.ReadLine();
                
                var customers = new Customers()
                {
                    FirstName=fname,
                    LastName=lname,
                    ContactNo=contactNo,

                };
                context.Customers.Add(customers);
                context.SaveChanges();


            }
        }
        public void addShippingAddress()
        {
            using (var context = new ToyFactoryDbContext())
            {
                Console.WriteLine("Add Addresses:-");
                Console.Write("Enter Address:");
                string address = Console.ReadLine();
                Console.Write("Enter Customer_FirstName:");
                string fname=Console.ReadLine();
                var obj = context.Customers.Single(t => t.FirstName == fname);
                int id = obj.CustomerId;

                var shipping = new ShippingAddress()
                {
                    ShippingAddress1= address,
                   CustomerId=id,               

                };
                context.ShippingAddress.Add(shipping);
                context.SaveChanges();


            }

        }
        public void getToys()
        {
            using(var context =new ToyFactoryDbContext())
            {
                foreach(var toy in context.Toys.ToList())
                {
                    Console.WriteLine(toy.ToyName+","+toy.ToyPrice+","+toy.ToyColor+","+toy.ToyWeight);
                }
            }
        }
    }
}
