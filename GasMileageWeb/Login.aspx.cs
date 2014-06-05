namespace GasMileageWeb
{    
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;

    ///<summary>
    ///class description
    ///</summary>
    ///<remarks>
    ///additional information about the class
    ///</remarks>		
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtbxUser.Text = "";
            txtPassword.Text = "";
        }

  
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            OwnerBusObj ownerobjbus = new OwnerBusObj();
            List<Owner> ol = new List<Owner>();

            CarBusObj carobjbus = new CarBusObj();
            List<Car> cl = new List<Car>();

            Owner newowner = new Owner();
            newowner.FNAME = txtbxUser.Text;

            ol = ownerobjbus.GetAllBusObjOwners();
            cl = carobjbus.GetAllBusObjCars();

            var result = ol.Where(x => x.USERID == txtbxUser.Text
                && x.PASSWORD == txtPassword.Text).LongCount();

            if (result == 1)
            {
                User u = new User();
                u.PK_ID_USER = ol.Where(x => x.USERID == txtbxUser.Text
                && x.PASSWORD == txtPassword.Text).Select(x => x.PK_OWNER_ID).FirstOrDefault();
                u.FNAME = ol.Where(x => x.USERID == txtbxUser.Text
                && x.PASSWORD == txtPassword.Text).Select(x => x.FNAME).FirstOrDefault().ToString();
                u.LNAME = ol.Where(x => x.USERID == txtbxUser.Text
                && x.PASSWORD == txtPassword.Text).Select(x => x.LNAME).FirstOrDefault().ToString();
                u.USERTYPE = ol.Where(x => x.USERID == txtbxUser.Text
                && x.PASSWORD == txtPassword.Text).Select(x => x.USERTYPE).FirstOrDefault().ToString();
                u.OWNERTABLEID = ol.Where(x => x.USERID == txtbxUser.Text
                    && x.PASSWORD == txtPassword.Text).Select(x => x.PK_OWNER_ID).FirstOrDefault();


               // TODO - GET LIST OF CARS FOR THIS OWENER
                u.CARTABLEIDS = cl.Where(x => x.FK_OWNER_ID == u.OWNERTABLEID).
                    Select(y => y.PK_CAR_ID).ToList<int>();

                Session["USER"] = u;
                
                Response.Redirect("Data.aspx");
            }
            else
            {
                lblMessage.Text = "User and/or password not found. Try again.";
            }
            
        }
    }
}