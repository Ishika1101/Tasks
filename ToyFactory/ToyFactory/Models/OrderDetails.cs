using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class OrderDetails
    {
        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public int ToyId { get; set; }
        public int AddressId { get; set; }

        public virtual ShippingAddress Address { get; set; }
        public virtual Orders Order { get; set; }
        public virtual Toys Toy { get; set; }
    }
}
