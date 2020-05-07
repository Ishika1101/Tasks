using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProductApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductApp.Domains
{
    public class ProductDomain
    {
        public void searchProduct(Products product)
        {


            using (var context = new CustomerProductDbContext())
            {
                var s = context.Database.ExecuteSqlCommand("spSearchProduct @searchtext",
                new SqlParameter("@searchtext", product.ProductCode ) 
               
                
                );
            }
        }
        public void filterProduct(Products product)
        {


            using (var context = new CustomerProductDbContext())
            {

                var s = context.Database.ExecuteSqlCommand("spFilterProduct @searchtext",
                new SqlParameter("@searchtext", product.ProductStatus)
                 

                );
               
            }
        }
        public List<Products> getAllProducts()
        {
            using (var context = new CustomerProductDbContext())
            {
               
               var result= context.Products.Select(x => x).ToList();
                return result;
            }
        }
        public void addProduct(Products product)
        {
            using (var context = new CustomerProductDbContext())
            {

                context.Products.Add(product);
                context.SaveChanges();
            }
        }
        public void deleteProduct(int id)
        {
            var product = new Products
            { ProductId = id };
            using (var context = new CustomerProductDbContext())
            {
                context.Remove<Products>(product);
                context.SaveChanges();
            }
        }


    }
}
