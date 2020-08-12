using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
    
namespace ClaimDetailsService.Models
{
    public class ClaimDetails
    {
        public int MemberID { get; set; }

        public string MemberName { get; set; }

        public int ClaimID { get; set; }

        public string ClaimType { get; set; }

        public decimal ClaimAmount { get; set; }

        public DateTime ClaimDate { get; set; }

        public string Remarks { get; set; }
    }
}
