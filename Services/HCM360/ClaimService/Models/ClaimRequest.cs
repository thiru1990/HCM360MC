using System;
using System.ComponentModel.DataAnnotations;

namespace ClaimService.Models
{
    public class ClaimRequest
    {
        [Required(ErrorMessage = "Claim type is required")]
        public string ClaimType { get; set; }

        [Required(ErrorMessage = "Claim amount is required")]
        public decimal ClaimAmount { get; set; }

        [Required(ErrorMessage = "Claim date is required")]
        public DateTime ClaimDate { get; set; }

        [Required(ErrorMessage = "Remarks is required")]
        public string Remarks { get; set; }

        [Required(ErrorMessage = "MemberID is required")]
        public int MemberID { get; set; }
    }

    public enum ClaimType
    {
        Medical = 1,
        Dental = 2,
        Vision = 3
    }
}
