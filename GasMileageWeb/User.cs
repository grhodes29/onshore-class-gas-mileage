using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GasMileageWeb
{
    public class User
    {

        public int PK_ID_USER { get; set; }
        public string FNAME { get; set; }
        public string LNAME { get; set; }
        public string USERTYPE { get; set; }
        public int OWNERTABLEID { get; set; }
        public List<int> CARTABLEIDS { get; set; }

 
    }
}