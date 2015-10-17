using FDBBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FDBWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
            if (authHelper.Instance.GetLogedInUserFromCookie() != null)
            {
                Response.Redirect("MedicinePrice.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            LoggedInUser _user = authHelper.Instance.AuthenticateUser(txtUserName.Text.Trim(), txtPassword.Text.Trim(), chkRememberMe.Checked);
            if (_user != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                {
                    if (Request.QueryString["ReturnUrl"] != "/")
                    {
                        Response.Redirect(Request.QueryString["ReturnUrl"]);
                    }
                    else
                    {
                        Response.Redirect("~/MedicinePrice.aspx");
                    }
                }
                else
                    Response.Redirect("~/MedicinePrice.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid user name or password.";
                //Response.Redirect("message.aspx?m=" + Encrypter.DecryptQryParam("1"));
            }
        }
    }
}