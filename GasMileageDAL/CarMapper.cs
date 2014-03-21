namespace GasMileageDAL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    ///<summary>
    /// corresponds to the data and datatypes in table CAR in GASMILEAGE DATABASE
    ///</summary>
    ///<remarks>
    /// additional information about the class
    ///</remarks>			
    public class CarMapper
    {
       
        public int PK_CAR_ID { get; set; }
        public int FK_OWNER_ID { get; set; }
        public string VIN { get; set; }
        public string MAKE { get; set; }
        public string MODEL { get; set; }
        public int YEAR { get; set; }


        ///<summary>
        ///method description
        ///</summary>
        ///<remarks>
        ///additional information about the class
        ///</remarks>
        ///<param name=""></param>
        ///<return></return>
        public void LoadCarMapper(object[] array)
        {
            this.PK_CAR_ID = (int)array[0];
            this.FK_OWNER_ID = (int)array[1];
            this.VIN = array[2].ToString();
            this.MAKE = array[3].ToString();
            this.MODEL = array[4].ToString();
            this.YEAR = (int)array[5];

 
        }
        
    }
}
