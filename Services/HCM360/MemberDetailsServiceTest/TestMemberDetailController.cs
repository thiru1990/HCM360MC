using HCM360.Data.Models;
using MemberDetailsService.Controllers;
using MemberDetailsService.DataService;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MemberDetailsServiceTest
{
    class TestMemberDetailController
    {
        private Mock<IMemberDetailsService> _memberDetails;
        private Mock<ILogger<MemberDetailController>> _logger;
        private MemberDetailController _controller;

        [SetUp]
        public void Setup()
        {
            _memberDetails = new Mock<IMemberDetailsService>();
            _logger = new Mock<ILogger<MemberDetailController>>();
            _controller = new MemberDetailController(_memberDetails.Object, _logger.Object);
        }

        [Test]
        public void GetMember_VerifyMemDtls_ReturnMemDetails()
        {
            //Arrange
            _memberDetails.Setup(x => x.GetMemberById(1)).Returns(GetRelativeMember());

            //Act
            var result = _controller.GetMember(1);

            //Assert
            var okResult = result.Result as OkObjectResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(200, okResult.StatusCode);
        }

        [Test]
        public void GetMember_VerifyMemDtls_ReturnNoMemDetails()
        {
            Member mem = null;
            //Arrange
            _memberDetails.Setup(x => x.GetMemberById(1)).Returns(Task.Run(() => mem));

            //Act
            var result = _controller.GetMember(1);

            //Assert
            var notFoundResult = result.Result as NotFoundResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(404, notFoundResult.StatusCode);
        }

        private Task<Member> GetRelativeMember()
        {
            var result = new Member
            {
                MemberId =1,
                MemberFirstName = "FirstName",
                MemberLastName = "LastName",
                MemberAddress = "Address 1",
                MemberState = "TN",
                MemberEmailAddress = "test@test.com",
                MemberSsn = "111111111",
                PhysicianId = 1
            };
            
            return Task.Run(() => result);
        }
    }
}
