using System;
using System.Collections.Generic;

namespace HCM360.Data.Models
{
    public partial class Claims
    {
        public int ClaimId { get; set; }
        public int? ClaimTypeId { get; set; }
        public decimal? ClaimAmount { get; set; }
        public DateTime? ClaimDate { get; set; }
        public string Remarks { get; set; }
        public int? MemberId { get; set; }

        public virtual ClaimTypes ClaimType { get; set; }
        public virtual Member Member { get; set; }
    }
}
