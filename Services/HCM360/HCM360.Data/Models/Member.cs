using System;
using System.Collections.Generic;

namespace HCM360.Data.Models
{
    public partial class Member
    {
        public Member()
        {
            Claims = new HashSet<Claims>();
        }

        public int MemberId { get; set; }
        public string MemberFirstName { get; set; }
        public string MemberLastName { get; set; }
        public string MemberAddress { get; set; }
        public string MemberState { get; set; }
        public string MemberEmailAddress { get; set; }
        public string MemberSsn { get; set; }
        public int? PhysicianId { get; set; }

        public virtual Physician Physician { get; set; }
        public virtual ICollection<Claims> Claims { get; set; }
    }
}
