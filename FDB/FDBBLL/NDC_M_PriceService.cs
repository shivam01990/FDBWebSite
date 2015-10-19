using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FDBDAL;

namespace FDBBLL
{
   public class NDC_M_PriceService
    {
       public static NDC_M_PriceService Instance = new NDC_M_PriceService();

       public List<NDC_M_PRICE> GetNDCPrice(string NDC)
       {
           List<NDC_M_PRICE> rType = new List<NDC_M_PRICE>();
           using (FDBEntities db =new FDBEntities())
           {
               rType = db.NDC_M_PRICE.Where(n => n.NDC == NDC || NDC == "").ToList();
           }
           return rType;
       }
    }
}
