namespace GasMileageBLL
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;
    
    
    public class Car
    {
        
        public int PK_CAR_ID { get; set; }
        public int FK_OWNER_ID { get; set; }
        public string VIN { get; set; }
        public string MAKE { get; set; }
        public string MODEL { get; set; }
        public int YEAR { get; set; }
        public string FNAME { get; set; }
        public string LNAME { get; set; }


        public static CarMapper ObjToMapper(Car iObjCar)
        {
            CarMapper mapper = new CarMapper();
            mapper.PK_CAR_ID = iObjCar.PK_CAR_ID;
            mapper.FK_OWNER_ID = iObjCar.FK_OWNER_ID;
            mapper.VIN = iObjCar.VIN;
            mapper.MAKE = iObjCar.MAKE;
            mapper.MODEL = iObjCar.MODEL;
            mapper.YEAR = iObjCar.YEAR;
 

            return mapper;
        }

        public static Car MapperToObj(CarMapper iCarMapper)
        {
            Car obj = new Car();
            obj.PK_CAR_ID = iCarMapper.PK_CAR_ID;
            obj.FK_OWNER_ID = iCarMapper.FK_OWNER_ID;
            obj.VIN = iCarMapper.VIN;
            obj.MAKE = iCarMapper.MAKE;
            obj.MODEL = iCarMapper.MODEL;
            obj.YEAR = iCarMapper.YEAR;

            return obj;
        }
    
    }
}
