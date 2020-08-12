using HCM360.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MemberDetailsService.DataService
{
    public interface IMemberDetailsService
    {
        Task<Member> GetMemberById(int id);
    }
}
