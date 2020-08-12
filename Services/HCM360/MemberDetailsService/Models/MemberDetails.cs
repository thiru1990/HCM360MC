using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MemberDetailsService.Models
{
    public class MemberDetails
    {
        public int MemberID { get; set; }

        public string MemberFirstName { get; set; }

        public string MemberLastName { get; set; }

        public string Address { get; set; }

        public string State { get; set; }

        public string EmailAddress { get; set; }

        public string SSN { get; set; }

        public int PhysicianID { get; set; }
    }
}
