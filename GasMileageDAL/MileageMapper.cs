namespace GasMileageDAL
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
     
    
    public class MileageMapper
    {
        public int PK_CARMILEAGE_ID { get; set; }
        public int FK_CAR_ID { get; set; }
        public DateTime FILLUPDATE { get; set; }
        public int STARTDISTANCE { get; set; }
        public int ENDDISTANCE { get; set; }
        public double PRICEPERGALLON { get; set; }
        public double GALLONS { get; set; }
        public double MPG { get; set; }
        public double FILLUPCOST { get; set; }


        public void LoadMileageMapper(object[] array)
        {
            this.PK_CARMILEAGE_ID = (int)array[0];
            this.FK_CAR_ID = (int)array[1];
            this.FILLUPDATE = Convert.ToDateTime(array[2]);
            this.STARTDISTANCE = (int)array[3];
            this.ENDDISTANCE = (int)array[4];
            this.PRICEPERGALLON = Convert.ToDouble(array[5]);
            this.GALLONS = Convert.ToDouble(array[6]);
            this.MPG = Convert.ToDouble(array[7]);
            this.FILLUPCOST = Convert.ToDouble(array[8]);

            //if (array[7] == DBNull.Value)
            //{ this.ZIPADDON = null; }
            //else
            //{
            //    this.ZIPADDON = (int)array[7];
            //}


        }
 
    }
}
