using FDBDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FDBBLL
{
    public class UserService
    {
        #region--Instance--
        public static UserService Instance = new UserService();
        #endregion

        #region--Autenticate Login--
        public bool AutenticateLogin(string LoginId, string Password)
        {
            bool rType = false;
            int Count = 0;
            using (FDBEntities db = new FDBEntities())
            {
                Count = db.Users.Where(u => u.LoginID == LoginId && u.Password == Password).Count();
                if (Count > 0)
                {
                    rType = true;
                }
            }
            return rType;
        }
        #endregion

        #region--
        public List<User> GetUsers(int UserID)
        {

            List<User> UserList = new List<User>();
            using (FDBEntities db = new FDBEntities())
            {
                UserList = db.Users.Where(u => u.UserID == UserID).ToList();
               
            }
            return UserList;
        }
        #endregion


    }
}
