using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class Company
    {
        public Company()
        {
            BusinessUnits = new HashSet<BusinessUnits>();
        }

        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string Location { get; set; }

        public virtual ICollection<BusinessUnits> BusinessUnits { get; set; }
    }
}
