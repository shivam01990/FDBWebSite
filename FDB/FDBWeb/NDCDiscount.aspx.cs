using FDBBLL;
using FDBDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FDBWeb
{
    public partial class NDCDiscount : System.Web.UI.Page
    {
        int _ndc_discountid = 0;
        public int NDC_DISCOUNTID
        {
            get
            {
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"].ToString(), out _ndc_discountid);
                }
                return _ndc_discountid;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductType();
                BindFacility();
                BindNDCDiscount();

            }
        }

        protected void BindNDCDiscount()
        {
            if (NDC_DISCOUNTID > 0)
            {
                NDC_Discounts NDC_Discount = NDCDiscountsServices.Instance.GetNDCDiscounts(NDC_DISCOUNTID, "").FirstOrDefault();
                txtNDC.Text = NDC_Discount.NDC;
                txtDiscount.Text = NDC_Discount.Discount_Percent.ToString();
                if (ddlFacility.Items.FindByValue(NDC_Discount.FacilityID.ToString()) != null)
                {
                    ddlFacility.ClearSelection();
                    ddlFacility.Items.FindByValue(NDC_Discount.FacilityID.ToString()).Selected = true;
                }
                if (ddlProductType.Items.FindByValue(NDC_Discount.ProductTypeID.ToString()) != null)
                {
                    ddlProductType.ClearSelection();
                    ddlProductType.Items.FindByValue(NDC_Discount.ProductTypeID.ToString()).Selected = true;
                }
            }
        }

        protected void BindProductType()
        {
            List<ProductType> ProductTypeList = ProductTypeServices.Instance.GetProductType(0);
            ddlProductType.AppendDataBoundItems = true;
            ddlProductType.DataSource = ProductTypeList;
            ddlProductType.DataTextField = "Description";
            ddlProductType.DataValueField = "ProductTypeID";
            ddlProductType.DataBind();
            ddlProductType.Items.Insert(0, (new ListItem() { Value = "0", Text = "Select" }));
        }

        protected void BindFacility()
        {
            List<FACILITY> FacilityList = FacilityService.Instance.GetFacility("");
            ddlFacility.AppendDataBoundItems = true;
            ddlFacility.DataSource = FacilityList;
            ddlFacility.DataTextField = "FACILITY_KEY";
            ddlFacility.DataValueField = "FACILITY_ID";
            ddlFacility.DataBind();
            ddlFacility.Items.Insert(0, (new ListItem() { Value = "0", Text = "Select" }));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
            double discount = 0;
            double.TryParse(txtDiscount.Text, out discount);
            NDC_Discounts NDC_DiscountObj = new NDC_Discounts();
            NDC_DiscountObj.NDC_DiscountID = NDC_DISCOUNTID;
            NDC_DiscountObj.NDC = txtNDC.Text;
            NDC_DiscountObj.FacilityID = int.Parse(ddlFacility.SelectedValue.ToString());
            NDC_DiscountObj.ProductTypeID = int.Parse(ddlProductType.SelectedValue);
            NDC_DiscountObj.Discount_Percent = discount;
            int id=NDCDiscountsServices.Instance.CreateUpdateNDCDiscount(NDC_DiscountObj);
            if (id > 0)
            {
                Common.Instance.ShowAlertMsg("NDC_Discount is saved", true, DivMsg);
            }
            else
            {

                Common.Instance.ShowAlertMsg("NDC_Discount is Unsaved", false, DivMsg);
            }
        }
    }
}