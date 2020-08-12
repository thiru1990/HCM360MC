using HCM360.Data.Models;
using HCM360.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

namespace PhysicianDetailsService.DataService
{
    public class PhysicianDetailsService : IPhysicianDetailsService
    {
        private readonly IRepository<Physician> _physicianRepository;

        public PhysicianDetailsService(IRepository<Physician> physicianRepository)
        {
            _physicianRepository = physicianRepository;
        }

        public async Task<Physician> GetPhysicianById(int id)
        {
            return await _physicianRepository.GetAll().FirstOrDefaultAsync(x => x.PhysicianId == id);
        }
    }
}
