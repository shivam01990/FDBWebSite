using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FDBDAL;

namespace FDBBLL
{
    public class FacilityService
    {
        public static FacilityService Instance = new FacilityService();

        #region--Get Facility--
        public List<FACILITY> GetFacility(string FACILITY_KEY)
       {
           using(FDBEntities db = new FDBEntities())
	        {
                return db.FACILITies.Where(u=>u.FACILITY_KEY==FACILITY_KEY).ToList();
	        }
           
       }
        #endregion
    }
}
