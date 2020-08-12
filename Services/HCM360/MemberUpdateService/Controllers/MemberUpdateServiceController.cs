using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using MemberUpdateService.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using ServiceBus.Models;

namespace MemberUpdateService.Controllers
{
    [Route("api/{v:apiVersion}/[controller]")]
    [ApiController]
    public class MemberUpdateServiceController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly ILogger<MemberUpdateServiceController> _logger;
        private readonly IHttpClientFactory _httpClient;
        private readonly IServiceBus _serviceBus;

        public MemberUpdateServiceController(IConfiguration configuration, ILogger<MemberUpdateServiceController> logger, IHttpClientFactory httpClient, IServiceBus serviceBus)
        {
            _configuration = configuration;
            _logger = logger;
            _httpClient = httpClient;
            _serviceBus = serviceBus;
        }

        [HttpPatch]
        public IActionResult UpdateMember(int id, [FromBody] JsonPatchDocument<MemberDetails> memberPatch)
        {
            var member = GetMember(id);
            memberPatch.ApplyTo(member);
            _serviceBus.Publish(member);
            return Ok(member);
        }

        private MemberDetails GetMember(int id)
        {
            _logger.LogInformation("GetMember IN");
            try
            {
                var client = _httpClient.CreateClient();
                client.DefaultRequestHeaders.Add("AuthorizationKey", _configuration["AuthorizationKey"]);
                var response = client.GetStringAsync(new Uri(_configuration["MemberDetailService"] + id)).Result;

                var member = JsonConvert.DeserializeObject<MemberDetails>(response);

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
    }
}
