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
    public partial class NDCDiscounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }


        #region ---Bind Offers---
        public void BindGrid()
        {
            List<NDC_Discounts> NDCList = NDCDiscountsServices.Instance.GetNDCDiscounts(0, txtNDC.Text.Trim());
            GrdOffers.DataSource = NDCList;
            GrdOffers.DataBind();
        }
        #endregion

        #region ---Grid Methods---
        protected void GrdOffers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "Delete")
            //{
            //    if (Offers.Instance.DeleteOffer(int.Parse(e.CommandArgument.ToString())))
            //    {
            //        Common.ShowMessage(DivMsg, "Offer successfully deleted", Page.ResolveUrl("~"), true);
            //        BindOffers();
            //    }
            //    else
            //    {
            //        Common.ShowMessage(DivMsg, "Unable to delete Offer", Page.ResolveUrl("~"), true);
            //    }
            //}
        }
        protected void GrdOffers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //sp_GetOfferList_Result data = (sp_GetOfferList_Result)e.Row.DataItem;
                //LinkButton LnkDelete = (LinkButton)e.Row.FindControl("LnkDelete");
                //if (LnkDelete != null)
                //{
                //    LnkDelete.CommandName = "Delete";
                //    LnkDelete.CommandArgument = data.OfferID.ToString();
                //    LnkDelete.Attributes.Add("onclick", "return ConfirmBoxWithPostBack('Are you sure to delete this Offer?','" + LnkDelete.UniqueID + "');");
                //}
            }
        }
        protected void GrdOffers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GrdOffers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //HdnPageNo.Value = e.NewPageIndex.ToString();
            //BindOffers();
        }
        protected void GrdOffers_Sorting(object sender, GridViewSortEventArgs e)
        {

            //if (Sortdir == SortDirection.Ascending)
            //{
            //    Sortdir = SortDirection.Descending;
            //}
            //else
            //{
            //    Sortdir = SortDirection.Ascending;
            //}
            //HdnOrderBy.Value = e.SortExpression.ToString();
            //BindOffers();
        }
        #endregion

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtNDC.Text = "";
            BindGrid();
        }
    }
}