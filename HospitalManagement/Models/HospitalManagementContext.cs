using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace HospitalManagement.Models
{
    public partial class HospitalManagementContext : DbContext
    {
        public HospitalManagementContext()
        {
        }

        public HospitalManagementContext(DbContextOptions<HospitalManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Appointments> Appointments { get; set; }
        public virtual DbSet<AssignAssistants> AssignAssistants { get; set; }
        public virtual DbSet<AssignPrescription> AssignPrescription { get; set; }
        public virtual DbSet<Departments> Departments { get; set; }
        public virtual DbSet<Doctors> Doctors { get; set; }
        public virtual DbSet<HealthAssistants> HealthAssistants { get; set; }
        public virtual DbSet<Patients> Patients { get; set; }
        public virtual DbSet<Prescription> Prescription { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=ISHIKAGANGWAL;Database=HospitalManagement;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Appointments>(entity =>
            {
                entity.HasKey(e => e.AppointmentId)
                    .HasName("PK_AssignDoctors");

                entity.Property(e => e.AppointmentTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<AssignAssistants>(entity =>
            {
                entity.HasKey(e => e.AssignAssistantId);

                entity.HasOne(d => d.Appointment)
                    .WithMany(p => p.AssignAssistants)
                    .HasForeignKey(d => d.AppointmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssignAssistants_Appointments");

                entity.HasOne(d => d.Assistant)
                    .WithMany(p => p.AssignAssistants)
                    .HasForeignKey(d => d.AssistantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssignAssistants_HealthAssistants");
            });

            modelBuilder.Entity<AssignPrescription>(entity =>
            {
                entity.HasKey(e => e.AssignPrescription1);

                entity.Property(e => e.AssignPrescription1).HasColumnName("AssignPrescription");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.AssignPrescription)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssignPrescription_Doctors");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.AssignPrescription)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssignPrescription_Patients");

                entity.HasOne(d => d.Prescription)
                    .WithMany(p => p.AssignPrescription)
                    .HasForeignKey(d => d.PrescriptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssignPrescription_Prescription");
            });

            modelBuilder.Entity<Departments>(entity =>
            {
                entity.HasKey(e => e.DepartmentId);

                entity.Property(e => e.DepartmentDetails)
                    .IsRequired()
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctors>(entity =>
            {
                entity.HasKey(e => e.DoctorId);

                entity.HasIndex(e => e.ContactNo)
                    .HasName("IX_Table_1_Contact")
                    .IsUnique();

                entity.Property(e => e.ContactNo)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Gender)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Specialization)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.DepartmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Doctors_Departments");
            });

            modelBuilder.Entity<HealthAssistants>(entity =>
            {
                entity.HasKey(e => e.AssistantId);

                entity.Property(e => e.AssistantId).ValueGeneratedNever();

                entity.Property(e => e.AssistantName)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.HealthAssistants)
                    .HasForeignKey(d => d.DepartmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_HealthAssistants_Departments1");
            });

            modelBuilder.Entity<Patients>(entity =>
            {
                entity.HasKey(e => e.PatientId);

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ContactNo)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Gender)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Prescription>(entity =>
            {
                entity.Property(e => e.Afternoon)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Morning)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Night)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PrescriptionDisease)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
