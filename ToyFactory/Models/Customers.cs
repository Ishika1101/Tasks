using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class Customers
    {
        public Customers()
        {
            Orders = new HashSet<Orders>();
            ShippingAddress = new HashSet<ShippingAddress>();
        }

        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ContactNo { get; set; }

        public virtual ICollection<Orders> Orders { get; set; }
        public virtual ICollection<ShippingAddress> ShippingAddress { get; set; }
    }
}
