namespace GasMileageBLL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;
   

    public class Mileage
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


        ///<summary>
        ///method description
        ///</summary>
        ///<remarks>
        ///additional information about the class
        ///</remarks>
        ///<param name=""></param>
        ///<return></return>
        public static MileageMapper ObjToMapper(Mileage mileage)
        {
            MileageMapper mapper = new MileageMapper();
            mapper.PK_CARMILEAGE_ID = mileage.PK_CARMILEAGE_ID;
            mapper.FK_CAR_ID = mileage.FK_CAR_ID;
            mapper.FILLUPDATE = mileage.FILLUPDATE;
            mapper.STARTDISTANCE = mileage.STARTDISTANCE;
            mapper.ENDDISTANCE = mileage.ENDDISTANCE;
            mapper.PRICEPERGALLON = mileage.PRICEPERGALLON;
            mapper.GALLONS = mileage.GALLONS;
            mapper.MPG = mileage.MPG;
            mapper.FILLUPCOST = mileage.FILLUPCOST;

            return mapper;
        }

        ///<summary>
        ///method description
        ///</summary>
        ///<remarks>
        ///additional information about the class
        ///</remarks>
        ///<param name=""></param>
        ///<return></return>
        public static Mileage MapperToObj(MileageMapper mapper)
        {
            Mileage obj = new Mileage();
            obj.PK_CARMILEAGE_ID = mapper.PK_CARMILEAGE_ID;
            obj.FK_CAR_ID = mapper.FK_CAR_ID;
            obj.FILLUPDATE = mapper.FILLUPDATE;
            obj.STARTDISTANCE = mapper.STARTDISTANCE;
            obj.ENDDISTANCE = mapper.ENDDISTANCE;
            obj.PRICEPERGALLON = mapper.PRICEPERGALLON;
            obj.GALLONS = mapper.GALLONS;
            obj.MPG = mapper.MPG;
            obj.FILLUPCOST = mapper.FILLUPCOST;

            return obj;
        }

    }
}
