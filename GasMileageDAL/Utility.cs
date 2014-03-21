namespace GasMileageDAL
{
                        using System;
                        using System.Collections.Generic;
                        using System.Linq;
                        using System.Text;
                        using System.Threading.Tasks;
                        using System.Configuration;

    ///<summary>
    ///class description
    ///</summary>
    ///<remarks>
    ///additional information about the class
    ///</remarks>			
    public static class Utility
    {


        ///<summary>
        ///method description
        ///</summary>
        ///<remarks>
        ///additional information about the class
        ///</remarks>
        ///<param name=""></param>
        ///<return></return>
        static public string GetConnectionString()
        {
            var connectionstring = System.Configuration.ConfigurationManager.
                ConnectionStrings["GasMileageConnection"].
                ToString();
            return connectionstring;
        }
    
    }
}
