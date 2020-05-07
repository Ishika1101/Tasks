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
    public class SearchController : ControllerBase
    {
        ProductDomain d = new ProductDomain();

        [HttpGet]
        public IActionResult Get(Products pro)
        {
            using (var context = new CustomerProductDbContext())
            {
                d.searchProduct(pro);
                return Ok(pro);
            }
        }
        [HttpPost]
        public IActionResult Post(Products product)
        {
            d.filterProduct(product);
            return Ok();
        }
    }
}