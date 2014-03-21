namespace GasMileageBLL
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;
    
    
    public class CarBusObj
    {

        public List<Car> GetAllBusObjCars()
        {

            CarRepository carRepos = new CarRepository();
            List<Car> ol = new List<Car>();

            foreach (var element in carRepos.GetAllCars())
            {
                ol.Add(Car.MapperToObj(element));
            }

            return ol;
        }

        public int AddBusObjCar(Car iCar)
        {
            CarRepository carResp = new CarRepository();
            var result = carResp.AddCar(Car.ObjToMapper(iCar));
            return result;
        }

        public int DeleteBusObjCar(int iCarID)
        {
            CarRepository carResp = new CarRepository();
            var result = carResp.DeleteCar(iCarID);
            return result;
        }

        public int UpdateBusObjCar(Car iCar)
        {
            CarRepository carResp = new CarRepository();
            var result = carResp.UpdateCar(Car.ObjToMapper(iCar));
            return result;
        } 
         
    }
}
