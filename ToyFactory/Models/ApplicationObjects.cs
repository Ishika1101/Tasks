using System;
using System.Collections.Generic;

namespace ToyFactory.Models
{
    public partial class ApplicationObjects
    {
        public int ApplicationObjectId { get; set; }
        public string ApplicationObjectName { get; set; }
        public int ApplicationObjectTypeId { get; set; }
        public int StatusId { get; set; }

        public virtual ApplicationObjectTypes ApplicationObjectType { get; set; }
    }
}
