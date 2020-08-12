using HCM360.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClaimDetailsService.DataService
{
    public interface IClaimDetailsService
    {
        Task<List<Claims>> GetClaimsByMemberId(int id);
    }
}
