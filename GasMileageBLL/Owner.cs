namespace GasMileageBLL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using GasMileageDAL;

    ///<summary>
    ///class description
    ///</summary>
    ///<remarks>
    ///additional information about the class
    ///</remarks>		
    public class Owner
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


        ///<summary>
        ///method description
        ///</summary>
        ///<remarks>
        ///additional information about the class
        ///</remarks>
        ///<param name=""></param>
        ///<return></return>
        public static OwnerMapper ObjToMapper(Owner owner)
        {
            OwnerMapper mapper = new OwnerMapper();
            mapper.PK_OWNER_ID = owner.PK_OWNER_ID;
            mapper.FNAME = owner.FNAME;
            mapper.LNAME = owner.LNAME;
            mapper.ADDRESS = owner.ADDRESS;
            mapper.CITY = owner.CITY;
            mapper.STATE = owner.STATE;
            mapper.ZIPMAIN = owner.ZIPMAIN;
            mapper.USERTYPE = owner.USERTYPE;
            mapper.USERID = owner.USERID;
            mapper.PASSWORD = owner.PASSWORD;
 
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
        public static Owner MapperToObj(OwnerMapper mapper)
        {
                  Owner obj = new Owner();                
                  obj.PK_OWNER_ID = mapper.PK_OWNER_ID;
                  obj.FNAME = mapper.FNAME;                       
                  obj.LNAME =   mapper.LNAME;
                  obj.ADDRESS = mapper.ADDRESS;                
                  obj.CITY = mapper.CITY;               
                  obj.STATE = mapper.STATE;              
                  obj.ZIPMAIN = mapper.ZIPMAIN;              
                  obj.USERTYPE = mapper.USERTYPE;         
                  obj.USERID = mapper.USERID;           
                  obj.PASSWORD = mapper.PASSWORD;             
                                          
            return obj;
        }
    }
}
