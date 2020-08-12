using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ClaimService.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ServiceBus.Models;

namespace ClaimService.Controllers
{
    [Route("api/{v:apiVersion}/[controller]")]
    [ApiController]
    public class ClaimsServiceController : ControllerBase
    {
        private readonly ILogger<ClaimsServiceController> _logger;
        private readonly IServiceBus _serviceBus;

        public ClaimsServiceController(ILogger<ClaimsServiceController> logger, IServiceBus serviceBus)
        {
            _logger = logger;
            _serviceBus = serviceBus;
        }

        [HttpPost]
        public IActionResult InsertClaim([FromBody]ClaimRequest request)
        {
            _serviceBus.Publish(request);
            return Ok();
        }
    }
}
