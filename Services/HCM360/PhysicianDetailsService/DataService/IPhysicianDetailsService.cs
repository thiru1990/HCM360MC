using HCM360.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PhysicianDetailsService.DataService
{
    public interface IPhysicianDetailsService
    {
        Task<Physician> GetPhysicianById(int id);
    }
}
