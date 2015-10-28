using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FDBDAL;

namespace FDBBLL
{
   public class MedicineService
    {
       public static MedicineService Instance = new MedicineService();

        public List<Medicine> GetMedicine(int MedicineID)
        {
            List<Medicine> rType = new List<Medicine>();
            using (FDBEntities db = new FDBEntities())
            {
                rType = db.Medicines.Where(n => n.MedicineID == MedicineID || MedicineID == 0).ToList();
            }
            return rType;
        }
    }
}
