using System;
using System.Data.SqlClient;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace UpdateMember
{
    public static class UpdateMember
    {
        [FunctionName("UpdateMember")]
        public static void Run([ServiceBusTrigger("%TopicName%", "%SubscriptionName%", Connection = "AzureBusConnectionString")] string mySbMsg, ILogger log)
        {
            log.LogInformation($"C# ServiceBus topic trigger function processed message: {mySbMsg}");
            var member = JsonConvert.DeserializeObject<MemberDetails>(mySbMsg);
            if (member != null)
            {
                var str = Environment.GetEnvironmentVariable("SqlConnectionString");
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    var query = "UPDATE tbMemberDetails SET MemberFirstName = '" + member.MemberFirstName + "',MemberLastName = '" + member.MemberLastName + "' , MemberAddress = '" + member.Address + "', MemberState = '" + member.State + "', MemberEmailAddress = '" + member.EmailAddress + "', MemberSSN = '" + member.SSN + "', PhysicianID = " + member.PhysicianID + " WHERE MemberID = " + member.MemberID;
                    log.LogInformation($"insert query : {query}");
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        var rows = cmd.ExecuteNonQueryAsync();
                        log.LogInformation($"{rows} rows were updated");
                    }
                }
            }
        }
    }

    public class MemberDetails
    {
        public int MemberID { get; set; }

        public string MemberFirstName { get; set; }

        public string MemberLastName { get; set; }

        public string Address { get; set; }

        public string State { get; set; }

        public string EmailAddress { get; set; }

        public string SSN { get; set; }

        public int PhysicianID { get; set; }
    }
}
