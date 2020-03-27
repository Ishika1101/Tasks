using CompanyManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CompanyManagement.Domains
{
    class BusinessUnitDomain:CompanyDbContext
    {
        BusinessUnits unit = new BusinessUnits();
        public void addUnits()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Add Business Units:");
                Console.Write("Enter UnitName:");
                unit.UnitName = Console.ReadLine();
                Console.Write("Enter CompanyId");
                unit.CompanyId = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter NumberOfProjects:");
                unit.NumberOfProjects = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter NumberOfEmployees:");
                unit.NumberOfEmployees = Convert.ToInt32(Console.ReadLine());
                BusinessUnits.Add(unit);
                SaveChanges();
            }
        }

        public void updateUnits()
        {
            using (var context = new CompanyDbContext())
            {
                Console.WriteLine("Update Business Units:");
                Console.Write("Enter UnitName:");
                string name = Console.ReadLine();
                
                try
                {
                    var b = context.BusinessUnits.Single(t => t.UnitName == name);
                    unit.BusinessUnitId = b.BusinessUnitId;
                    unit.UnitName = b.UnitName;
                    unit.CompanyId = b.CompanyId;
                    Console.Write("Enter NumberOfProjects:");
                    unit.NumberOfProjects = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Enter NumberOfEmployees:");
                    unit.NumberOfEmployees = Convert.ToInt32(Console.ReadLine());
                    BusinessUnits.Update(unit);
                    SaveChanges();
                }
                catch
                {
                    Console.WriteLine("BusinessUnit Doen't exist");
                    throw new ArgumentException("BusinessUnit Doen't exist");
                }
            }
        }

    }
}
