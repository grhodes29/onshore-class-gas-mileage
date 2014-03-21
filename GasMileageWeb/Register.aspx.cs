namespace GasMileageWeb
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;
       
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDropDownLists();
        }

        private void BindDropDownLists()
        {
            List<string> lstUserType = new List<string>();
            lstUserType.Add("ADMIN");
            lstUserType.Add("REGULAR");

            drpdwnlstUsertype.DataSource = lstUserType;
            drpdwnlstUsertype.DataBind();
            drpdwnlstUsertype.SelectedValue = "REGULAR";

        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
                        
            txtbxFname.Text = "";
            txtbxLname.Text = "";
            txtbxAddress.Text = "";
            txtbxCity.Text = "";
            txtbxState.Text = "";
            txtbxZipmain.Text = "";
            drpdwnlstUsertype.SelectedValue = "REGULAR";
            txtbxUserid.Text = "";
            txtbxPassword.Text = "";          
            
        }


        protected void btnSumit_Click(object sender, EventArgs e)
        {
            Owner owner = new Owner();

            owner.FNAME = txtbxFname.Text;
            owner.LNAME = txtbxLname.Text;
            owner.ADDRESS = txtbxAddress.Text;
            owner.CITY = txtbxCity.Text;
            owner.STATE = txtbxState.Text;
            owner.ZIPMAIN = Convert.ToInt32(txtbxZipmain.Text);
            owner.USERTYPE = drpdwnlstUsertype.SelectedValue;
            owner.USERID = txtbxUserid.Text;
            owner.PASSWORD = txtbxPassword.Text;

            OwnerBusObj obj = new OwnerBusObj();
            List<Owner> ol = new List<Owner>();

            ol = obj.GetAllBusObjOwners();

            var result = ol.Where(x => x.USERID == txtbxUserid.Text).LongCount();

            if (result == 1)
            {
                lblMessage.Text = "Pick another Email Login. This one is already used.";
            }
            else
            {
                obj.AddBusObjOwner(owner);
                Response.Redirect("Login.aspx");
            }

        }


    }
}