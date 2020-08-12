using System.Collections.Generic;

namespace HCM360.Data.Models
{
    public partial class Physician
    {
        public Physician()
        {
            MemberDetails = new HashSet<Member>();
        }

        public int PhysicianId { get; set; }
        public string PhysicianName { get; set; }
        public string PhysicianState { get; set; }

        public virtual ICollection<Member> MemberDetails { get; set; }
    }
}
