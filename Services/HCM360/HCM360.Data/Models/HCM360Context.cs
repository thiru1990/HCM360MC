using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace HCM360.Data.Models
{
    public partial class HCM360Context : DbContext
    {
        public HCM360Context()
        {
        }

        public HCM360Context(DbContextOptions<HCM360Context> options)
            : base(options)
        {
        }

        public virtual DbSet<ClaimTypes> ClaimTypes { get; set; }
        public virtual DbSet<Claims> Claims { get; set; }
        public virtual DbSet<Member> MemberDetails { get; set; }
        public virtual DbSet<Physician> Physician { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ClaimTypes>(entity =>
            {
                entity.HasKey(e => e.ClaimTypeId)
                    .HasName("PK__tbClaimT__DAE60D9C4763F6B5");

                entity.ToTable("tbClaimTypes");

                entity.Property(e => e.ClaimTypeId).HasColumnName("ClaimTypeID");

                entity.Property(e => e.ClaimType)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Claims>(entity =>
            {
                entity.HasKey(e => e.ClaimId)
                    .HasName("PK__tbClaims__EF2E13BB96581A16");

                entity.ToTable("tbClaims");

                entity.Property(e => e.ClaimId).HasColumnName("ClaimID");

                entity.Property(e => e.ClaimAmount).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.ClaimDate).HasColumnType("datetime");

                entity.Property(e => e.ClaimTypeId).HasColumnName("ClaimTypeID");

                entity.Property(e => e.MemberId).HasColumnName("MemberID");

                entity.Property(e => e.Remarks)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.ClaimType)
                    .WithMany(p => p.Claims)
                    .HasForeignKey(d => d.ClaimTypeId)
                    .HasConstraintName("FK__tbClaims__ClaimT__36B12243");

                entity.HasOne(d => d.Member)
                    .WithMany(p => p.Claims)
                    .HasForeignKey(d => d.MemberId)
                    .HasConstraintName("FK__tbClaims__Member__37A5467C");
            });

            modelBuilder.Entity<Member>(entity =>
            {
                entity.HasKey(e => e.MemberId)
                    .HasName("PK__tbMember__0CF04B380DBE8049");

                entity.ToTable("tbMemberDetails");

                entity.Property(e => e.MemberId).HasColumnName("MemberID");

                entity.Property(e => e.MemberAddress)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.MemberEmailAddress)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MemberFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MemberLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MemberSsn)
                    .HasColumnName("MemberSSN")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.MemberState)
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.PhysicianId).HasColumnName("PhysicianID");

                entity.HasOne(d => d.Physician)
                    .WithMany(p => p.MemberDetails)
                    .HasForeignKey(d => d.PhysicianId)
                    .HasConstraintName("FK__tbMemberD__Physi__286302EC");
            });

            modelBuilder.Entity<Physician>(entity =>
            {
                entity.HasKey(e => e.PhysicianId)
                    .HasName("PK__tbPhysic__DFF5D293464B70E7");

                entity.ToTable("tbPhysician");

                entity.Property(e => e.PhysicianName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PhysicianState)
                    .HasMaxLength(5)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
