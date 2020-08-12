using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MemberService.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ServiceBus.Models;

namespace MemberService.Controllers
{
    [Route("api/{v:apiVersion}/[controller]")]
    [ApiController]
    public class MemberServiceController : ControllerBase
    {
        private readonly ILogger<MemberServiceController> _logger;
        private readonly IServiceBus _serviceBus;

        public MemberServiceController(ILogger<MemberServiceController> logger, IServiceBus serviceBus)
        {
            _logger = logger;
            _serviceBus = serviceBus;
        }

        [HttpPost]
        public IActionResult InsertMember([FromBody]MemberRequest request)
        {
            _serviceBus.Publish(request);
            return Created(HttpContext.Request.Scheme + "://" +
                HttpContext.Request.Host.ToUriComponent() + "/api/v1/member/", "Success");
        }
    }
}
