namespace GasMileageBLL
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;


    public class OwnerBusObj
    {
        public List<Owner> GetAllBusObjOwners() 
        {
          
            OwnerRepository ownerRepos = new OwnerRepository();
            List<Owner> ol = new List<Owner>();

            foreach (var element in ownerRepos.GetAllOwners())
            {
                ol.Add(Owner.MapperToObj(element));                      
            }

            return ol;
        }

        public int AddBusObjOwner(Owner iOwner) 
        {
          
            OwnerRepository ownerResp = new OwnerRepository();
            var result = ownerResp.AddOwner(Owner.ObjToMapper(iOwner));
            return result;
        }

        public int DeleteBusObjOwner(int iOwnerID)
        {
            Owner owner = new Owner();
            OwnerRepository ownerResp = new OwnerRepository();
            var result = ownerResp.DeleteOwner(iOwnerID);
            return result;
        }

        public int UpdateBusObjOwner(Owner iOwner) 
        {

            OwnerRepository ownerResp = new OwnerRepository();
            var result = ownerResp.UpdateOwner(Owner.ObjToMapper(iOwner));
            return result;
        }
             
    
    }
}
