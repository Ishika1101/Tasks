using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductApp.Domains;
using ProductApp.Models;

namespace ProductApp.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
       CustomerDomain d = new CustomerDomain();

        [HttpGet]
        public IActionResult Get(Customers customer)
        {
            using (var context = new CustomerProductDbContext())
            {
               int i=d.loginCustomer(customer);
                if (i == 0)
                {
                    return Ok("Login Failed");
                }
                else
                {
                    return Ok(customer.CustomerNumber);
                }
            }
        }


        [HttpPost]
        public IActionResult Post(Customers customer)
        {
            d.addCustomer(customer);
            return Ok("Added Succesfully");
        }

        [HttpPut]
        public IActionResult Put(VCustomerUpdate customer)
        {
            d.updateCustomer(customer);
            return Ok("Updated Successfully");
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            d.deleteCustomer(id);
            return Ok("Removed Successfully");
        }
    }
}