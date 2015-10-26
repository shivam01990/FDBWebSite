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

        public int CreateUpdateNDCDiscount(NDC_Discounts ud)
        {
            int NDC_DiscountID = 0;
            using (FDBEntities db = new FDBEntities())
            {
                if (ud.NDC_DiscountID > 0)
                {
                    NDC_Discounts temp = db.NDC_Discounts.Where(u => u.NDC_DiscountID == ud.NDC_DiscountID).FirstOrDefault();

                    if (temp != null)
                    {
                        temp.NDC = ud.NDC;
                        temp.Discount_Percent = ud.Discount_Percent;
                        temp.FacilityID = ud.FacilityID;
                        temp.ProductTypeID = ud.ProductTypeID;
                    }
                }
                else
                {
                    db.NDC_Discounts.Add(ud);
                }

                int x = db.SaveChanges();
                if (x > 0)
                {
                    NDC_DiscountID = ud.NDC_DiscountID;
                }
            }

            return NDC_DiscountID;
        }
    }
}
