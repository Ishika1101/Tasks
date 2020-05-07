using ProductApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductApp.Domains
{
    public class CustomerDomain : CustomerProductDbContext
        {
            public void addCustomer(Customers customer)
            {
                using (var context = new CustomerProductDbContext())
                {
                    Random r = new Random();
                    customer.CustomerNumber = r.Next(1000);

                    context.Customers.Add(customer);
                    context.SaveChanges();
                }
            }
            public void updateCustomer(VCustomerUpdate updateCustomer)
            {
                using (var context = new CustomerProductDbContext())
                {
                    context.VCustomerUpdate.Update(updateCustomer);
                    context.SaveChanges();
                }

            }

        public int loginCustomer(Customers customer)
        {
            
            using (var context = new CustomerProductDbContext())
            {
             
                var result =context.Customers.Single(cust=>cust.Email==customer.Email && cust.Password ==customer.Password);
                if (result != null)
                {
                    int i = result.CustomerNumber;
                    
                    return i;
                }
                else
                {
                    return 0;
                }
            }
        }

        public void deleteCustomer(int id)
        {
                 var customer = new Customers
                    { CustomerNumber = id };
                using (var context = new CustomerProductDbContext())
                {
                    context.Remove<Customers>(customer);
                    context.SaveChanges();
                }
                

           
        }


    }
    
}
