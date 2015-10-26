using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FDBDAL;

namespace FDBBLL
{
    public class ProductTypeServices
    {
        public static ProductTypeServices Instance = new ProductTypeServices();

        public List<ProductType> GetProductType(int ProductTypeId)
        {
            List<ProductType> rType = new List<ProductType>();
            using (FDBEntities db = new FDBEntities())
            {
                rType = db.ProductTypes.Where(p => p.ProductTypeID == ProductTypeId || ProductTypeId == 0).ToList();
            }
            return rType;
        }

        public int CreateUpdateProductTypeServices(ProductType ud)
        {
            int ProductTypeID = 0;
            using (FDBEntities db = new FDBEntities())
            {
                if (ud.ProductTypeID > 0)
                {
                    ProductType temp = db.ProductTypes.Where(u => u.ProductTypeID == ud.ProductTypeID).FirstOrDefault();

                    if (temp != null)
                    {
                        temp.Description = ud.Description;                       
                    }
                }
                else
                {
                    db.ProductTypes.Add(ud);
                }

                int x = db.SaveChanges();
                if (x > 0)
                {
                    ProductTypeID = ud.ProductTypeID;
                }
            }

            return ProductTypeID;
        }
    }
}
