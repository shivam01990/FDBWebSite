using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FDBBLL
{
    [Serializable]
    [XmlRootAttribute("UserData")]
    public class LoggedInUser
    {
        [XmlElement("UserID")]
        public int UserID = -1;
        [XmlElement("Name")]
        public string Name = string.Empty;
        [XmlElement("Email")]
        public string Email = string.Empty;
        [XmlElement("Roles")]
        public string[] Roles = null;
    }
}
