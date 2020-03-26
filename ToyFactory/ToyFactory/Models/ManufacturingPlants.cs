using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class ManufacturingPlants
    {
        public ManufacturingPlants()
        {
            Toys = new HashSet<Toys>();
        }

        public int ManufacturingPlantId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }

        public virtual ICollection<Toys> Toys { get; set; }
    }
}
