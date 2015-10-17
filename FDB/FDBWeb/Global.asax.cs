using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace FDBWeb
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity id =
                            (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = id.Ticket;

                        // Get the stored user-data, in this case, our roles
                        string userData = ticket.UserData;
                        System.Xml.Serialization.XmlSerializer x = new System.Xml.Serialization.XmlSerializer(typeof(FDBBLL.LoggedInUser));
                        FDBBLL.LoggedInUser _user = (FDBBLL.LoggedInUser)x.Deserialize(new System.IO.StringReader(userData));

                        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(id, _user.Roles);
                    }
                }
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}