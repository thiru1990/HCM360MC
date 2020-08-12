using ClaimDetailsService.Controllers;
using ClaimDetailsService.DataService;
using HCM360.Data.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace ClaimDetailsServiceTest
{
    class TestClaimDetailsController
    {
        private Mock<IClaimDetailsService> _claimDetailsSvc;
        private Mock<ILogger<ClaimDetailsController>> _logger;
        private ClaimDetailsController _controller;

        [SetUp]
        public void Setup()
        {
            _claimDetailsSvc = new Mock<IClaimDetailsService>();
            _logger = new Mock<ILogger<ClaimDetailsController>>();
            _controller = new ClaimDetailsController(_claimDetailsSvc.Object, _logger.Object);
        }

        [Test]
        public void GetMember_VerifyClmDtls_ReturnsClmDetails()
        {
            //Arrange
            _claimDetailsSvc.Setup(x => x.GetClaimsByMemberId(1)).Returns(GetRelativeClaims());

            //Act
            var result = _controller.GetClaimDetails(1);

            //Assert
            var okResult = result.Result as OkObjectResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(200, okResult.StatusCode);
        }

        [Test]
        public void GetMember_VerifyClmDtls_ReturnsNoClmDetails()
        {
            //Arrange
            _claimDetailsSvc.Setup(x => x.GetClaimsByMemberId(1)).Returns(Task.Run(() => new List<Claims>()));

            //Act
            var result = _controller.GetClaimDetails(1);

            //Assert
            var notFoundResult = result.Result as NotFoundResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(404, notFoundResult.StatusCode);
        }

        private Task<List<Claims>> GetRelativeClaims()
        {
            var result = new List<Claims>();
            result.Add(new Claims
            {
                MemberId = 1,
                Member = new Member { },
                ClaimAmount = 10,
                ClaimDate = DateTime.Now,
                ClaimId = 2,
                ClaimType = new ClaimTypes { },
                ClaimTypeId = 1,
                Remarks = "Test Claims"
            });
            return Task.Run(() => result);
        }
    }
}
