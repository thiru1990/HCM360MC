using System;
using System.Net.Http;
using System.Threading.Tasks;
using HCM360.Data.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using PhysicianDetailsService.DataService;
using PhysicianDetailsService.Models;

namespace PhysicianDetailsService.Controllers
{
    [ApiController]
    [Route("api/{v:apiVersion}/[controller]")]
    public class PhysicianController : ControllerBase
    {
        private readonly IPhysicianDetailsService _physicianDetails;
        private readonly IConfiguration _configuration;
        private readonly ILogger<PhysicianController> _logger;
        private readonly IHttpClientFactory _httpClient;

        //Expanded expression bodied members
        public PhysicianController(IPhysicianDetailsService physicianDetails, IConfiguration configuration, ILogger<PhysicianController> logger, IHttpClientFactory httpClient)
        => (_physicianDetails, _configuration, _logger, _httpClient) = (physicianDetails, configuration, logger, httpClient);

        [HttpGet("{id}")]
        public async Task<ActionResult> GetPhysicianAsync(int id)
        {
            _logger.LogInformation("GetPhysicianAsync IN");
            var member = GetMember(id);

            if (member == null)
            {
                _logger.LogInformation("GetPhysicianAsync OUT");
                return Forbid();
            }

            _logger.LogInformation("GetPhysicianAsync OUT");
            var response = await GetPhysicianDetail(member);
            if (response == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(await GetPhysicianDetail(member));
            }
        }

        private Member GetMember(int id)
        {
            _logger.LogInformation("GetMember IN");
            try
            {                
                var client = _httpClient.CreateClient();
                client.DefaultRequestHeaders.Add("AuthorizationKey", _configuration["AuthorizationKey"]);
                var response = client.GetStringAsync(new Uri(_configuration["MemberDetailService"] + id)).Result;

                var member = JsonConvert.DeserializeObject<Member>(response);

                _logger.LogDebug("GetMember Member Info : {0}", JsonConvert.SerializeObject(member));
                _logger.LogInformation("GetMember OUT");
                return member;
            }
            catch (Exception ex)
            {
                _logger.LogError("GetMember Error Occurred : {0}", ex.ToString());
                return null;
            }
        }

        private Task<PhysicianDetail> GetPhysicianDetail(Member mem)
        {
            _logger.LogInformation("GetPhysicianDetail IN");
            var physician = _physicianDetails.GetPhysicianById(mem.PhysicianId.Value);
            PhysicianDetail result = null;
            if (physician != null && physician.Result != null)
            {
                result = new PhysicianDetail { MemberName = mem.MemberFirstName + " " + mem.MemberLastName, MemberID = mem.MemberId, PhysicianName = physician.Result.PhysicianName };
            }
            _logger.LogDebug("Physician Detail: {0}", JsonConvert.SerializeObject(result));
           _logger.LogInformation("GetPhysicianDetail OUT");
            return Task.Run(() => result);
        }
    }
}
