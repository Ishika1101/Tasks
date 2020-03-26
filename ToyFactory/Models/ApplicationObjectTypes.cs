using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class ApplicationObjectTypes
    {
        public ApplicationObjectTypes()
        {
            ApplicationObjects = new HashSet<ApplicationObjects>();
        }

        public int ApplicationObjectTypeId { get; set; }
        public string ApplicationObjectTypeName { get; set; }
        public int StatusId { get; set; }

        public virtual ICollection<ApplicationObjects> ApplicationObjects { get; set; }
    }
}
