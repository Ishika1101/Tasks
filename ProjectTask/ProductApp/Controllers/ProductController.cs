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
    public class ProductController : ControllerBase
    {
        ProductDomain d = new ProductDomain();

        [HttpGet]
        public IActionResult Get()
        {
            using (var context = new CustomerProductDbContext())
            {
                var r=d.getAllProducts();
                return Ok(r);
            }
        }
        [HttpPost]
        public IActionResult Post(Products product)
        {
            d.addProduct(product);
            return Ok("Added Succesfully");
        }

        

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            d.deleteProduct(id);
            return Ok("Removed Successfully");
        }
    }
}