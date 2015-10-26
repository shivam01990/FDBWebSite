using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FDBBLL
{
    public class Common
    {
        #region---Get Instance---
        public static Common Instance = new Common();
        #endregion

        #region --Popup Alerts--

        public void ShowAlertMsg(string Msg, bool Issuccess, HtmlGenericControl JsPlc)
        {
             JsPlc.InnerHtml = "<div " + ((Issuccess == true) ? "class=\"alert alert-success\"" : "alert alert-warning") + " > " + Msg + "</div>";
             JsPlc.Visible = true;
        }

       
        #endregion

    }
}
