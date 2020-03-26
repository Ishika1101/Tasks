using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class ShippingAddress
    {
        public ShippingAddress()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int AddressId { get; set; }
        public string ShippingAddress1 { get; set; }
        public int CustomerId { get; set; }

        public virtual Customers Customer { get; set; }
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
