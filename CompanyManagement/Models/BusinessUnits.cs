using System;
using System.Collections.Generic;

namespace CompanyManagement.Models
{
    public partial class BusinessUnits
    {
        public BusinessUnits()
        {
            Employees = new HashSet<Employees>();
            Projects = new HashSet<Projects>();
        }

        public int BusinessUnitId { get; set; }
        public string UnitName { get; set; }
        public int CompanyId { get; set; }
        public int NumberOfProjects { get; set; }
        public int NumberOfEmployees { get; set; }

        public virtual Company Company { get; set; }
        public virtual ICollection<Employees> Employees { get; set; }
        public virtual ICollection<Projects> Projects { get; set; }
    }
}
