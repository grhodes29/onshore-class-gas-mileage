using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GasMileageDAL
{
    public class OwnerMapper
    {
        public int PK_OWNER_ID { get; set; }
        public string FNAME { get; set; }
        public string LNAME { get; set; }
        public string ADDRESS { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public int ZIPMAIN { get; set; }
        public string USERTYPE { get; set; }
        public string USERID { get; set; }
        public string PASSWORD { get; set; }

        public void LoadOwnerMapper(object[] array)
        {
            this.PK_OWNER_ID = (int)array[0];
            this.FNAME = array[1].ToString();
            this.LNAME = array[2].ToString();
            this.ADDRESS = array[3].ToString();
            this.CITY = array[4].ToString();
            this.STATE = array[5].ToString();
            this.ZIPMAIN = (int)array[6];
            this.USERTYPE = array[7].ToString();
            this.USERID = array[8].ToString();
            this.PASSWORD = array[9].ToString();
        }
    }
}
