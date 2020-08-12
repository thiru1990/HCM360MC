using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HCM360.Data.Models;
using MemberDetailsService.DataService;
using MemberDetailsService.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace MemberDetailsService.Controllers
{
    [ApiController]
    [Route("api/{v:apiVersion}/[controller]")]
    public class MemberDetailController : ControllerBase
    {
        private readonly IMemberDetailsService _memberDetails;
        private readonly ILogger<MemberDetailController> _logger;

        public MemberDetailController(IMemberDetailsService memberDetails, ILogger<MemberDetailController> logger)
        {
            _memberDetails = memberDetails;
            _logger = logger;
        }

        [AuthorizeAPI]
        [HttpGet("{id}")]
        [ApiVersion("1")]
        public async Task<ActionResult> GetMember(int id)
        {
            _logger.LogInformation("GetMember IN");
            var response = await GetRelativeMemberInfo(id);
            if (response == null)
            {
                _logger.LogInformation("GetMember OUT");
                return NotFound();
            }
            else
            {
                _logger.LogInformation("GetMember OUT");
                return Ok(response);
            }
        }

        [AuthorizeAPI]
        [HttpGet("{id}")]
        [ApiVersion("2")]
        public async Task<ActionResult> GetMemberV2(int id)
        {
            _logger.LogInformation("GetMember IN");
            var response = await GetRelativeMemberInfo(id);
            if (response == null)
            {
                _logger.LogInformation("GetMember OUT");
                return NotFound();
            }
            else
            {
                _logger.LogInformation("GetMember OUT");
                return Ok(response);
            }
        }

        private Task<MemberDetails> GetRelativeMemberInfo(int id)
        {
            _logger.LogInformation("GetRelativeMemberInfo IN");
            var member = _memberDetails.GetMemberById(id);
            MemberDetails result = null;
            if (member != null && member.Result != null)
            {
                var mem = member.Result;
                result = new MemberDetails { MemberFirstName = mem.MemberFirstName, MemberLastName = mem.MemberLastName, MemberID = mem.MemberId, Address = mem.MemberAddress, EmailAddress = mem.MemberEmailAddress, State = mem.MemberState, SSN = mem.MemberSsn, PhysicianID = mem.PhysicianId.Value };
            }
            _logger.LogInformation("GetRelativeMemberInfo OUT");
            return Task.Run(() => result);
        }
    }
}
