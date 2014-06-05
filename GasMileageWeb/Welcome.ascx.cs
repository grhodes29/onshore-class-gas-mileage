using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GasMileageWeb
{
    public partial class Welcome : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = new User();
            u = (User)Session["USER"];

            lblWelcome.Text = "Welcome " + u.FNAME + " " + u.LNAME + " / " + u.USERTYPE;

        }
    }
}