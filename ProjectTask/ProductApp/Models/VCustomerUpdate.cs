using System;
using System.Collections.Generic;

namespace ProductApp.Models
{
    public partial class VCustomerUpdate
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string Gender { get; set; }
        public DateTime Dob { get; set; }
        public string Address { get; set; }
        public int CustomerNumber { get; set; }
    }
}
