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
    }
}
