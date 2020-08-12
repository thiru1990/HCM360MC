using HCM360.Data.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Moq;
using Moq.Protected;
using Newtonsoft.Json;
using NUnit.Framework;
using PhysicianDetailsService.Controllers;
using PhysicianDetailsService.DataService;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace PhysicianDetailsServiceTest
{
    class TestPhysicianController
    {
        private Mock<IPhysicianDetailsService> _physicianDetails;
        private Mock<IConfiguration> _configuration;
        private Mock<ILogger<PhysicianController>> _logger;
        private Mock<IHttpClientFactory> _httpClient;
        private PhysicianController _controller;

        [SetUp]
        public void Setup()
        {
            _physicianDetails = new Mock<IPhysicianDetailsService>();
            _logger = new Mock<ILogger<PhysicianController>>();
            _configuration = new Mock<IConfiguration>();
            _httpClient = new Mock<IHttpClientFactory>();
            _controller = new PhysicianController(_physicianDetails.Object, _configuration.Object, _logger.Object, _httpClient.Object);
        }

        [Test]
        public void GetPhysicianAsync_VrfPhysicianDtls_RetrunOkResult()
        {
            _configuration.SetupGet(x => x[It.Is<string>(s => s == "MemberDetailService")]).Returns("http://localhost/");
            var mockHttpMessageHandler = new Mock<HttpMessageHandler>();
            mockHttpMessageHandler.Protected()
                .Setup<Task<HttpResponseMessage>>("SendAsync", ItExpr.IsAny<HttpRequestMessage>(), ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(new HttpResponseMessage
                {
                    StatusCode = HttpStatusCode.OK,
                    Content = new StringContent(GetMockMemberDetails()),
                });

            var client = new HttpClient(mockHttpMessageHandler.Object);
            _httpClient.Setup(_ => _.CreateClient(It.IsAny<string>())).Returns(client);
            _physicianDetails.Setup(x => x.GetPhysicianById(1)).Returns(GetPhysician());

            //Act
            var result = _controller.GetPhysicianAsync(1);

            //Assert
            var okResult = result.Result as OkObjectResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(200, okResult.StatusCode);
        }

        [Test]
        public void GetPhysicianAsync_VrfPhysicianDtls_RetrunForbidResult()
        {
            _configuration.SetupGet(x => x[It.Is<string>(s => s == "MemberDetailService")]).Returns("http://localhost/");
            var mockHttpMessageHandler = new Mock<HttpMessageHandler>();

            var client = new HttpClient(mockHttpMessageHandler.Object);
            _httpClient.Setup(_ => _.CreateClient(It.IsAny<string>())).Returns(client);
            _physicianDetails.Setup(x => x.GetPhysicianById(1)).Returns(GetPhysician());

            //Act
            var result = _controller.GetPhysicianAsync(1);

            //Assert
            var okResult = result.Result as ForbidResult;
            Assert.IsNotNull(result);
        }

        [Test]
        public void GetPhysicianAsync_VrfPhysicianDtls_RetrunNotFound()
        {
            Physician phy = null;
            _configuration.SetupGet(x => x[It.Is<string>(s => s == "MemberDetailService")]).Returns("http://localhost/");
            var mockHttpMessageHandler = new Mock<HttpMessageHandler>();
            mockHttpMessageHandler.Protected()
                .Setup<Task<HttpResponseMessage>>("SendAsync", ItExpr.IsAny<HttpRequestMessage>(), ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(new HttpResponseMessage
                {
                    StatusCode = HttpStatusCode.OK,
                    Content = new StringContent(GetMockMemberDetails()),
                });

            var client = new HttpClient(mockHttpMessageHandler.Object);
            _httpClient.Setup(_ => _.CreateClient(It.IsAny<string>())).Returns(client);
            _physicianDetails.Setup(x => x.GetPhysicianById(1)).Returns(Task.Run(() => phy));

            //Act
            var result = _controller.GetPhysicianAsync(1);

            //Assert
            var okResult = result.Result as NotFoundResult;
            Assert.IsNotNull(result);
            Assert.AreEqual(404, okResult.StatusCode);

        }
        private string GetMockMemberDetails()
        {
            var memDtls = new Member
            {
                MemberId = 1,
                MemberFirstName = "FirstName",
                MemberLastName = "LastName",
                MemberAddress = "Address 1",
                MemberEmailAddress = "Test@test.com",
                MemberSsn = "11111111",
                MemberState = "TN",
                PhysicianId = 1
            };
            return JsonConvert.SerializeObject(memDtls);
        }

        private Task<Physician> GetPhysician()
        {
            var physician = new Physician
            {
                PhysicianId = 1,
                PhysicianName = "Test Physician",
                PhysicianState = "TN"
            };
            return Task.Run(() => physician);
        }
    }
}
