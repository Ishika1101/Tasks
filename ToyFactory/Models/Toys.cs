using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class Toys
    {
        public Toys()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int ToyId { get; set; }
        public int ManufacturingPlantId { get; set; }
        public string ToyName { get; set; }
        public double ToyPrice { get; set; }
        public string ToyWeight { get; set; }
        public string ToyColor { get; set; }

        public virtual ManufacturingPlants ManufacturingPlant { get; set; }
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
