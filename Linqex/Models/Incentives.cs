using System;
using System.Collections.Generic;

namespace Linqex.Models
{
    public partial class Incentives
    {
        public int EmployeeId { get; set; }
        public DateTime IncentiveDate { get; set; }
        public int IncentiveAmount { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
