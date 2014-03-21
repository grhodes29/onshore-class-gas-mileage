namespace GasMileageBLL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;
    
    public class MileageBusObj
    {

        public List<Mileage> GetAllBusObjMileages()
        {

            MileageRepository mileageRepos = new MileageRepository();
            List<Mileage> ml = new List<Mileage>();

            foreach (var element in mileageRepos.GetAllMileage())
            {
                ml.Add(Mileage.MapperToObj(element));
            }

            return ml;
        }

        public int AddBusObjMileage(Mileage iMileage)
        {

            MileageRepository mileageResp = new MileageRepository();
            var result = mileageResp.AddMileage(Mileage.ObjToMapper(iMileage));
            return result;
        }

        public int DeleteBusObjMileage(int iMileageID)
        {
            MileageRepository mileageResp = new MileageRepository();
            var result = mileageResp.DeleteMileage(iMileageID);
            return result;
        }

        public int UpdateBusObjMileage(Mileage iMileage)
        {
            MileageRepository mileageResp = new MileageRepository();
            var result = mileageResp.UpdateMileage(Mileage.ObjToMapper(iMileage));
            return result;
        }
    
    
    
    
    }
}
