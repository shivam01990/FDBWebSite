using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FDBDAL;
using FDBBLL;

namespace FDBWeb
{
    public partial class AddEditProductType : System.Web.UI.Page
    {
        int _producttypeid = 0;
        public int ProductTypeID
        {
            get
            {
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"].ToString(), out _producttypeid);
                }
                return _producttypeid;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductType();
            }
        }

        private void BindProductType()
        {
            if (ProductTypeID > 0)
            {
                ProductType _productType = ProductTypeServices.Instance.GetProductType(ProductTypeID).FirstOrDefault();
                if(_productType!=null)
                {
                    txtDescription.Text = _productType.Description;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ProductType _productType = new ProductType();
            _productType.ProductTypeID = ProductTypeID;
            _productType.Description = txtDescription.Text;
           int id= ProductTypeServices.Instance.CreateUpdateProductTypeServices(_productType);
            if (id > 0)
            {
                Common.Instance.ShowAlertMsg("Product Type is saved", true, DivMsg);
            }
            else
            {

                Common.Instance.ShowAlertMsg("Product Type is Unsaved", false, DivMsg);
            }
        }
    }
}