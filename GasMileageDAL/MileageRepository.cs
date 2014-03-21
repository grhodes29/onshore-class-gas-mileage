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
    public class MileageRepository
    {

        public int DeleteMileage(int PK_CARMILEAGE_ID)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_MILEAGE_Delete";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@PK_CARMILEAGE_ID", PK_CARMILEAGE_ID));

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


        public List<MileageMapper> GetAllMileage()
        {

            try
            {
                List<MileageMapper> retList = new List<MileageMapper>();

                var connection = new SqlConnection(Utility.GetConnectionString());
                var command = connection.CreateCommand();

                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "up_MILEAGE_Select_All";

                var da = new SqlDataAdapter(command);

                MileageDataSet ds = new MileageDataSet();

                da.Fill(ds.MILEAGE);


                foreach (MileageDataSet.MILEAGERow dr in ds.MILEAGE)
                {
                    MileageMapper mapper = new MileageMapper();
                    mapper.LoadMileageMapper(dr.ItemArray);
                    retList.Add(mapper);
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



        public int AddMileage(MileageMapper m)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_MILEAGE_Insert";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@FILLUPDATE", m.FILLUPDATE));
                    command.Parameters.Add(new SqlParameter("@STARTDISTANCE", m.STARTDISTANCE));
                    command.Parameters.Add(new SqlParameter("@ENDDISTANCE", m.ENDDISTANCE));
                    command.Parameters.Add(new SqlParameter("@GALLONS", m.GALLONS));
                    command.Parameters.Add(new SqlParameter("@PRICEPERGALLON", m.PRICEPERGALLON));
                    command.Parameters.Add(new SqlParameter("@FK_CAR_ID", m.FK_CAR_ID));

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    connection.Close();

                    return result;


                }
            }
            catch (SqlException SqlExp)
            {
                throw new Exception(SqlExp.ToString());
            }
            catch (Exception exp)
            {
                throw new Exception(exp.ToString());
            }
        }


        public int UpdateMileage(MileageMapper m)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_MILEAGE_Update";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@FILLUPDATE", m.FILLUPDATE));
                    command.Parameters.Add(new SqlParameter("@STARTDISTANCE", m.STARTDISTANCE));
                    command.Parameters.Add(new SqlParameter("@ENDDISTANCE", m.ENDDISTANCE));
                    command.Parameters.Add(new SqlParameter("@GALLONS", m.GALLONS));
                    command.Parameters.Add(new SqlParameter("@PRICEPERGALLON", m.PRICEPERGALLON));
                    command.Parameters.Add(new SqlParameter("@PK_CARMILEAGE_ID", m.PK_CARMILEAGE_ID));

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
    }
}
