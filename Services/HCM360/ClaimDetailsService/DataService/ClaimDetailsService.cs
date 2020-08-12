using HCM360.Data.Models;
using HCM360.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClaimDetailsService.DataService
{
    public class ClaimDetailsService : IClaimDetailsService
    {
        private readonly IRepository<Claims> _claimsRepository;

        public ClaimDetailsService(IRepository<Claims> claimsRepository)
        {
            _claimsRepository = claimsRepository;
        }

        public async Task<List<Claims>> GetClaimsByMemberId(int id)
        {
            return await _claimsRepository.GetAll().Include(claims => claims.ClaimType).Include( mem => mem.Member).Where(x => x.MemberId == id).ToListAsync();           
        }
    }
}
