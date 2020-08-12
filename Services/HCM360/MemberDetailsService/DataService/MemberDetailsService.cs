using HCM360.Data.Models;
using HCM360.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MemberDetailsService.DataService
{
    public class MemberDetailsService : IMemberDetailsService
    {
        private readonly IRepository<Member> _memberRepository;

        public MemberDetailsService (IRepository<Member> memberRepository)
        {
            _memberRepository = memberRepository;
        }

        public async Task<Member> GetMemberById(int id)
        {
            return await _memberRepository.GetAll().FirstOrDefaultAsync(x => x.MemberId == id);
        }
    }
}
 