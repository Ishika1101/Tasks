using System;
using System.Linq;
using ToyFactory.Controllers;
using ToyFactory.Models;

namespace ToyFactory
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice;
            CustomerController customer = new CustomerController();
            OrderController order = new OrderController();
            do
            {
                Console.WriteLine("Enter Choice:");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:customer.addCustomers();
                        break;
                    case 2:customer.addShippingAddress();
                        break;
                    case 3:order.addOrder();
                        break;
                    case 4:customer.getToys();
                        break;
                    
                    default:
                        Console.WriteLine("Exit");
                        break;
                }
            } while (choice != 4);

           
        }
    }
}
