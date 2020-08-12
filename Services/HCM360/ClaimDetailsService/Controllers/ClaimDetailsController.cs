using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Claims;
using System.Threading.Tasks;
using ClaimDetailsService.DataService;
using ClaimDetailsService.Models;
using HCM360.Data.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace ClaimDetailsService.Controllers
{
    [Route("api/{v:apiVersion}/[controller]")]
    [ApiController]
    public class ClaimDetailsController : ControllerBase
    {
        private readonly IClaimDetailsService _claimDetailsSvc;
        private readonly ILogger<ClaimDetailsController> _logger;

        public ClaimDetailsController(IClaimDetailsService claimDetailsSvc, ILogger<ClaimDetailsController> logger)
        {
            _claimDetailsSvc = claimDetailsSvc;
            _logger = logger;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetClaimDetails(int id)
        {
            _logger.LogInformation("GetClaimDetails IN");
            var response = await GetRelativeClaims(id);
            if(response == null)
            {
                _logger.LogInformation("GetClaimDetails OUT");
                return NotFound();
            }
            else
            {
                _logger.LogInformation("GetClaimDetails OUT");
                return Ok(response);
            }
        }

        private Task<List<ClaimDetails>> GetRelativeClaims(int memberId)
        {
            _logger.LogInformation("GetRelativeClaims IN");
            var claims = _claimDetailsSvc.GetClaimsByMemberId(memberId);
            List<ClaimDetails> result = null;
            if(claims != null && claims.Result != null && claims.Result.Count > 0)
            {
                result = new List<ClaimDetails>();
                foreach(var clm in claims.Result)
                {
                    result.Add(new ClaimDetails
                    {
                        MemberID = clm.MemberId.Value,
                        MemberName = clm.Member.MemberFirstName + " " + clm.Member.MemberLastName,
                        ClaimID = clm.ClaimId,
                        ClaimAmount = clm.ClaimAmount.Value,
                        ClaimDate = clm.ClaimDate.Value,
                        ClaimType = clm.ClaimType.ClaimType,
                        Remarks = clm.Remarks
                    });
                }
                _logger.LogDebug("Result : {0}", JsonConvert.SerializeObject(result));
            }
            _logger.LogInformation("GetRelativeClaims OUT");
            return Task.Run(() => result);
        }
    }
}
