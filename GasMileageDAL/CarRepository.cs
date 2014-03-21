namespace GasMileageDAL
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Data;
    using System.Data.SqlClient;
    using System.Configuration;
    using GasMileageCL;


    public class CarRepository
    {

        public int AddCar(CarMapper c)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_CAR_Insert";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@VIN", c.VIN));
                    command.Parameters.Add(new SqlParameter("@MAKE", c.MAKE));
                    command.Parameters.Add(new SqlParameter("@MODEL", c.MODEL));
                    command.Parameters.Add(new SqlParameter("@YEAR", c.YEAR));
                    command.Parameters.Add(new SqlParameter("@FK_OWNER_ID", c.FK_OWNER_ID));

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


        public int UpdateCar(CarMapper c)
        {
            try
            {

                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_CAR_Update";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@VIN", c.VIN));
                    command.Parameters.Add(new SqlParameter("@MAKE", c.MAKE));
                    command.Parameters.Add(new SqlParameter("@MODEL", c.MODEL));
                    command.Parameters.Add(new SqlParameter("@YEAR", c.YEAR));
                    command.Parameters.Add(new SqlParameter("@PK_CAR_ID", c.PK_CAR_ID));

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




        public List<CarMapper> GetAllCars()
        {

            try
            {
               
                var connection = new SqlConnection(Utility.GetConnectionString());
                var command = connection.CreateCommand();

                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "up_CAR_Select_All";

                var da = new SqlDataAdapter(command);
            
                CarDataSet ds = new CarDataSet();
                List<CarMapper> ol = new List<CarMapper>();

                da.Fill(ds.CAR);

                foreach (CarDataSet.CARRow dr in ds.CAR)
                {

                    CarMapper mapper = new CarMapper();
                    mapper.LoadCarMapper(dr.ItemArray);
                    ol.Add(mapper);

                }

                return ol;
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


        public int DeleteCar(int PK_CAR_ID)
        {
            try
            {
                var connection = new SqlConnection();
                connection.ConnectionString = Utility.GetConnectionString();

                using (var command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "up_CAR_Delete";
                    // add parameters to command, which will be passed to the stored procedure
                    command.Parameters.Add(new SqlParameter("@PK_CAR_ID", PK_CAR_ID));

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
