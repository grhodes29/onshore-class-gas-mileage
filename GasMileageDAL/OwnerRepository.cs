using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using GasMileageCL;

namespace GasMileageDAL
{
    public class OwnerRepository
    {
       
        #region OwnerRepository Members



        public List<OwnerMapper> GetAllOwners()
        {

            try
            {
                List<OwnerMapper> retList = new List<OwnerMapper>();

                var connection = new SqlConnection(Utility.GetConnectionString());
                var command = connection.CreateCommand();

                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "up_OWNER_Select_All";

                var da = new SqlDataAdapter(command);

                OwnerDataSet ds = new OwnerDataSet();

                da.Fill(ds.OWNER);


                foreach (OwnerDataSet.OWNERRow dr in ds.OWNER)
                {

                    OwnerMapper obj = new OwnerMapper();
                    obj.LoadOwnerMapper(dr.ItemArray);
                    retList.Add(obj);

                }


                return retList;

            }
            catch (SqlException sExp)
            {
                throw new Exception(sExp.ToString());
            }
            catch (Exception exp)
            {
                throw new Exception(exp.ToString());
            }

        }

        //public OwnerDataSet GetAllOwners()
        //{

        //    try
        //    {
          

        //        var connection = new SqlConnection(Utility.GetConnectionString());
        //        var command = connection.CreateCommand();

        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "up_OWNER_Select_All";

        //        var da = new SqlDataAdapter(command);

        //        OwnerDataSet ds = new OwnerDataSet();

        //        da.Fill(ds.OWNER);
        //        return ds;

        //    }
        //    catch (SqlException sExp)
        //    {
        //        throw new Exception(sExp.ToString());
        //    }
        //    catch (Exception exp)
        //    {
        //        throw new Exception(exp.ToString());
        //    }

        //}



        public int AddOwner(OwnerMapper owner)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_OWNER_Insert";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@FNAME", owner.FNAME));
                    command.Parameters.Add(new SqlParameter("@LNAME", owner.LNAME));
                    command.Parameters.Add(new SqlParameter("@ADDRESS", owner.ADDRESS));
                    command.Parameters.Add(new SqlParameter("@CITY", owner.CITY));
                    command.Parameters.Add(new SqlParameter("@STATE", owner.STATE));
                    command.Parameters.Add(new SqlParameter("@ZIPMAIN", owner.ZIPMAIN));
                    command.Parameters.Add(new SqlParameter("@USERTYPE", owner.USERTYPE));
                    command.Parameters.Add(new SqlParameter("@USERID", owner.USERID));
                    command.Parameters.Add(new SqlParameter("@PASSWORD", owner.PASSWORD));

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    connection.Close();

                    return result;
                   
                }
            }
            catch (SqlException sExp)
            {
                throw new Exception(sExp.ToString());
            }
            catch (Exception exp)
            {
                throw new Exception(exp.ToString());
            }
        }



        public int DeleteOwner(int PK_OWNER_ID)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_OWNER_Delete";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@PK_OWNER_ID", PK_OWNER_ID));

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    connection.Close();

                    return result;

                }
            }
            catch (SqlException sExp)
            {
                throw new Exception(sExp.ToString());
            }
            catch (Exception exp)
            {
                throw new Exception(exp.ToString());
            }
        }


        public int UpdateOwner(OwnerMapper owner)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                   
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_OWNER_Update";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@PK_OWNER_ID", owner.PK_OWNER_ID));
                    command.Parameters.Add(new SqlParameter("@FNAME", owner.FNAME));
                    command.Parameters.Add(new SqlParameter("@LNAME", owner.LNAME));
                    command.Parameters.Add(new SqlParameter("@ADDRESS", owner.ADDRESS));
                    command.Parameters.Add(new SqlParameter("@CITY", owner.CITY));
                    command.Parameters.Add(new SqlParameter("@STATE", owner.STATE));
                    command.Parameters.Add(new SqlParameter("@ZIPMAIN", owner.ZIPMAIN));
                    command.Parameters.Add(new SqlParameter("@USERTYPE", owner.USERTYPE));
                    command.Parameters.Add(new SqlParameter("@USERID", owner.USERID));
                    command.Parameters.Add(new SqlParameter("@PASSWORD", owner.PASSWORD));

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    connection.Close();

                    return result;

                }
            }
            catch (SqlException sExp)
            {
                throw new Exception(sExp.ToString());
            }
            catch (Exception exp)
            {
                throw new Exception(exp.ToString());
            }
        }



        #endregion


    }
}
