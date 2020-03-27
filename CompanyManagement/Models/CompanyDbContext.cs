using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CompanyManagement.Models
{
    public partial class CompanyDbContext : DbContext
    {
        public CompanyDbContext()
        {
        }

        public CompanyDbContext(DbContextOptions<CompanyDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AssignProjects> AssignProjects { get; set; }
        public virtual DbSet<BusinessUnits> BusinessUnits { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<EmployeeLeave> EmployeeLeave { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<Projects> Projects { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=ISHIKAGANGWAL;Database=CompanyDb;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AssignProjects>(entity =>
            {
                entity.HasKey(e => e.AssignProjectId);

                entity.HasIndex(e => e.EmployeeId)
                    .HasName("IX_Table_1_EmployeeId")
                    .IsUnique();
            });

            modelBuilder.Entity<BusinessUnits>(entity =>
            {
                entity.HasKey(e => e.BusinessUnitId);

                entity.Property(e => e.UnitName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.BusinessUnits)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessUnits_Company");
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.Property(e => e.Location)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<EmployeeLeave>(entity =>
            {
                entity.HasKey(e => e.LeaveId);

                entity.Property(e => e.LeaveFrom).HasColumnType("date");

                entity.Property(e => e.LeaveTo).HasColumnType("date");

                entity.Property(e => e.LeaveType)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.EmployeeLeave)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmployeeLeave_Employees");
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.HasKey(e => e.EmployeeId);

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.EmployeeName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.JoiningDate).HasColumnType("date");

                entity.Property(e => e.MobileNo)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.HasOne(d => d.BusinessUnit)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.BusinessUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employees_BusinessUnits");
            });

            modelBuilder.Entity<Projects>(entity =>
            {
                entity.HasKey(e => e.ProjectId);

                entity.Property(e => e.Deadline).HasColumnType("date");

                entity.Property(e => e.ProjectName)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.HasOne(d => d.BusinessUnit)
                    .WithMany(p => p.Projects)
                    .HasForeignKey(d => d.BusinessUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Projects_BusinessUnits");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
