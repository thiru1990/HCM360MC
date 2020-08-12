using System;
using System.Data.SqlClient;
using System.Runtime.InteropServices.WindowsRuntime;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace AddClaims
{
    public static class AddClaims
    {
        public static string SQLConnectionString = Environment.GetEnvironmentVariable("SqlConnectionString");

        [FunctionName("AddClaims")]
        public static void Run([ServiceBusTrigger("%TopicName%", "%SubscriptionName%", Connection = "AzureBusConnectionString")] string mySbMsg, ILogger log)
        {
            log.LogInformation($"C# ServiceBus topic trigger function processed message: {mySbMsg}");

            var claim = JsonConvert.DeserializeObject<Claim>(mySbMsg);
            log.LogInformation($"C# ServiceBus topic trigger function processed message: {claim}");

            // Patter matching
            if (claim is Claim clm)
            {
                log.LogInformation($"C# ServiceBus topic trigger function processed message: {clm}");
                //
                var claimTypeID = GetClaimType(log: log, claimType: clm.ClaimType);
                if (claimTypeID > 0)
                {
                    using (SqlConnection con = new SqlConnection(SQLConnectionString))
                    {
                        con.Open();
                        var query = "INSERT INTO tbClaims VALUES(" + claimTypeID + "," + clm.ClaimAmount + ",'" + clm.ClaimDate.ToString() + "','" + clm.Remarks + "'," + clm.MemberID + ")";
                        log.LogInformation($"insert query : {query}");
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            var rows = cmd.ExecuteNonQuery();
                            log.LogInformation($"{rows} rows were updated");
                        }
                    }
                }
            }

            //Local Function
            int GetClaimType(string claimType, ILogger log)
            {
                //default literal expression
                int claimTypeID = default;
                using (SqlConnection con = new SqlConnection(SQLConnectionString))
                {
                    con.Open();
                    var query = "SELECT ClaimTypeID from tbClaimTypes where ClaimType = '" + claimType + "'";
                    log.LogInformation($"claim query : {query}");
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        var rows = cmd.ExecuteScalar();
                        log.LogInformation($"Claim Type ID: {rows}");
                        claimTypeID = Convert.ToInt32(rows);
                    }
                }
                return claimTypeID;
            }
        }
    }
    public class Claim
    {
        public string ClaimType { get; set; }

        public decimal ClaimAmount { get; set; }

        public DateTime ClaimDate { get; set; }

        public string Remarks { get; set; }

        public int MemberID { get; set; }
    }
}
