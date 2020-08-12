using System;
using System.Collections.Generic;

namespace HCM360.Data.Models
{
    public partial class ClaimTypes
    {
        public ClaimTypes()
        {
            Claims = new HashSet<Claims>();
        }

        public int ClaimTypeId { get; set; }
        public string ClaimType { get; set; }

        public virtual ICollection<Claims> Claims { get; set; }
    }
}
