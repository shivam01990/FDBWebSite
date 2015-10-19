using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FDBDAL;
namespace FDBBLL
{
    public class NDCDiscountsServices
    {
        public static NDCDiscountsServices Instance = new NDCDiscountsServices();

        public List<NDC_Discounts> GetNDCDiscounts(int NDC_DiscountID, string NDC)
        {
            List<NDC_Discounts> rType = new List<NDC_Discounts>();
            using (FDBEntities db = new FDBEntities())
            {
               // rType = db.NDC_Discounts.ToList();
                rType = (from n in db.NDC_Discounts
                         where ((n.NDC_DiscountID == NDC_DiscountID || NDC_DiscountID == 0) && (NDC == "" || n.NDC.Contains(NDC)))
                         select n).ToList();
           
            }
            return rType;
        }
    }
}
