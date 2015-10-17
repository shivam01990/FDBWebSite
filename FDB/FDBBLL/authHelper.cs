using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Xml.Serialization;
using FDBDAL;
using System.Security.Principal;

namespace FDBBLL
{
   public class authHelper
    {
       public static authHelper Instance = new authHelper();

       public static LoggedInUser User
       {
           get
           {
               // Local vars
               LoggedInUser user = new LoggedInUser();
               // Check to see if user is logged in
               if (HttpContext.Current.User != null
                   && HttpContext.Current.User.Identity.IsAuthenticated
                   && HttpContext.Current.User.Identity.AuthenticationType == "Forms")
               {
                   // Collec user identity and auth ticket
                   FormsIdentity userIdentity = (FormsIdentity)HttpContext.Current.User.Identity;
                   FormsAuthenticationTicket ticket = userIdentity.Ticket;

                   // Collect FAUser from ticket userdata
                   string userDataXml = ticket.UserData;
                   if (!string.IsNullOrEmpty(userDataXml))
                   {
                       using (StringReader stringReader = new StringReader(userDataXml))
                       {
                           XmlSerializer serializer = new XmlSerializer(typeof(LoggedInUser));
                           user = (LoggedInUser)serializer.Deserialize(stringReader);

                       }
                   }
               }
               // Return the user object
               return user;
           }
       }

       #region ---Get LogedIn User From Cookie---
       public LoggedInUser GetLogedInUserFromCookie()
       {
           // Local vars
           LoggedInUser user = null;

           // Check to see if user is logged in
           if (HttpContext.Current.User != null
               && HttpContext.Current.User.Identity.IsAuthenticated
               && HttpContext.Current.User.Identity.AuthenticationType == "Forms")
           {
               // Collec user identity and auth ticket
               FormsIdentity userIdentity = (FormsIdentity)HttpContext.Current.User.Identity;
               FormsAuthenticationTicket ticket = userIdentity.Ticket;

               // Collect FAUser from ticket userdata
               string userDataXml = ticket.UserData;
               if (!string.IsNullOrEmpty(userDataXml))
               {
                   using (StringReader stringReader = new StringReader(userDataXml))
                   {
                       XmlSerializer serializer = new XmlSerializer(typeof(LoggedInUser));
                       user = (LoggedInUser)serializer.Deserialize(stringReader);
                   }
               }
           }
           // Return the user object
           return user;
       } 
       
       #endregion

       public void LoggInMe()
       {
           HttpCookie logininfo = HttpContext.Current.Request.Cookies["kml"];
           if (logininfo != null)
           {
               HttpCookie decodedCookie = CookieSecurityProvider.Decrypt(logininfo);
           }
       }

       public void SaveLogin(string username, string password, bool keepMeloggedIn)
       {
           HttpCookie logininfo = new HttpCookie("kml");
           logininfo["un"] = username;
           logininfo["pwd"] = password;
           logininfo.HttpOnly = true;
           if (keepMeloggedIn)
           {
               logininfo.Expires = DateTime.Now.AddMonths(3);
           }
           else
           {
               logininfo.Expires = DateTime.Now.AddMonths(-3);
           }
           HttpCookie encodedCookie = CookieSecurityProvider.Encrypt(logininfo);
           HttpContext.Current.Response.Cookies.Add(encodedCookie);
           // HttpCookieEncryption.Encrypt(HttpContext.Current, "kml");

       }

       #region ---AuthenticateUser---
       public LoggedInUser AuthenticateUser(string username, string password, bool isPersistent)
       {
           LoggedInUser user = null;
           try
           {
               using (FDBEntities db = new FDBEntities())
               {
                   List<User> loginuser = db.Users.Where(u => u.LoginID == username && u.Password == password).ToList();
                   if (loginuser.Count() > 0)
                   {

                       FormsAuthentication.Initialize();
                       HttpCookie authCookie;
                       StringBuilder userString;
                       FormsAuthenticationTicket ticket;
                       string ticketHash;
                       XmlSerializer serializer = new XmlSerializer(typeof(LoggedInUser));
                       user = new LoggedInUser();                    
                       user.UserID = loginuser[0].UserID;
                       user.Name = loginuser[0].FirstName + " " + loginuser[0].FirstName;
                       user.Email = loginuser[0].Email;
                       user.Roles = "Admin".Split(',').ToArray() ;
                       userString = new StringBuilder();
                       // SaveLogin(email, password, isPersistent);

                       using (StringWriter stringWriter = new StringWriter(userString))
                       {
                           // Serialize the User
                           serializer.Serialize(stringWriter, user);
                       }
                       if (isPersistent == true)
                       {
                           ticket = new FormsAuthenticationTicket(
                                   1, loginuser[0].UserID.ToString(),
                                   DateTime.Now,
                                   DateTime.Now.AddMonths(3),
                                   isPersistent,
                                   userString.ToString(),
                                   FormsAuthentication.FormsCookiePath);
                           ticketHash = FormsAuthentication.Encrypt(ticket);
                           authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, ticketHash);
                           authCookie.Expires = DateTime.Now.AddMonths(3);
                       }
                       else
                       {
                           ticket = new FormsAuthenticationTicket(
                                  1, loginuser[0].UserID.ToString(),
                                  DateTime.Now,
                                  DateTime.Now.AddMinutes(HttpContext.Current.Session.Timeout),
                                  isPersistent,
                                  userString.ToString(),
                                  FormsAuthentication.FormsCookiePath);
                           ticketHash = FormsAuthentication.Encrypt(ticket);
                           authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, ticketHash);

                       }
                       if (isPersistent)
                       {
                           authCookie.Expires = ticket.Expiration;
                       }
                       HttpContext.Current.Response.Cookies.Add(authCookie);
                       if (HttpContext.Current.User != null)
                       {
                           HttpContext.Current.User = new GenericPrincipal(HttpContext.Current.User.Identity, user.Roles);
                       }

                   }

               }
           }
           catch (Exception ex) { throw ex; }
           return user;
       }
       #endregion

       #region---Get User Roles---
       public string[] GetUserRoles
       {
           get
           {
               string[] UserRoles = authHelper.User.Roles;
               //using (BDMEntities db = new BDMEntities())
               //{
               //    UserRoles = db.sp_GetUserRoles(authHelper.User.UserID).ToList().FromString();
               //}

               return UserRoles;
           }
       }
       #endregion

       #region ---Check Menu Permission---
       public bool CheckMenuPermission(string allowedroles)
       {
           bool flag = false;

           string[] roles = allowedroles.Split(',');
           for (int i = 0; i < roles.Length; i++)
           {
               if (authHelper.User.Roles.Contains(roles[i]))
               {
                   flag = true;
                   break;
               }
           }

           return flag;

       }
       public string HideMenuByPermission(string allowedroles)
       {

           string[] roles = allowedroles.Split(',');
           for (int i = 0; i < roles.Length; i++)
           {
               if (authHelper.User.Roles.Contains(roles[i]))
               {
                   return "";
               }
           }

           return "style='display:none;'";
       }
       #endregion

    }
}
