using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FDBBLL
{
    public class clsMedicine
    {
        public string Chain { get; set; }

        public string Facility { get; set; }

        public Nullable<DateTime> Month { get; set; }

        public string RX { get; set; }

        public Nullable<DateTime> Date { get; set; }

        public Nullable<int> PatientID { get; set; }

        public string PatientLast { get; set; }

        public string PatientFirst { get; set; }

        public string NDC { get; set; }

        public string Medication { get; set; }

        public Nullable<double> Quantity { get; set; }

        public Nullable<double> Cost { get; set; }

        public string Physician { get; set; }

        public string PhysicianNPI { get; set; }

        public string PayType { get; set; }

        public string DaysSupply { get; set; }

        public string RouteOfAdmin { get; set; }

        public string InventoryCategory { get; set; }

        public string Copay { get; set; }

        public string Brand { get; set; }

        public Nullable<double> SSG { get; set; }

        public Nullable<double> MSG { get; set; }

        public Nullable<double> PharmacyUnitPrice { get; set; }

        public Nullable<double> FDBUnitPrice { get; set; }

        public Nullable<double> PharmacyPrice { get; set; }

        public Nullable<double> FDBPrice { get; set; }
        public Nullable<double> PercentVariance { get; set; }
        public Nullable<double> Variance { get; set; }


    }
}
