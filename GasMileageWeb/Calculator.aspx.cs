namespace GasMileageWeb
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;
    
    
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // VB
            //if Not Page.IsPostBack then
            //   dim mycdcatalog=New DataSet
            //   mycdcatalog.ReadXml(MapPath("cdcatalog.xml"))
            //   cdcatalog.DataSource=mycdcatalog
            //   cdcatalog.DataBind()
            //end if

            if (!IsPostBack)
            {
                
               //  not sure what alldata is
               //  RepeaterCalculator.DataSource = alldata;
               //  RepeaterCalculator.DataBind();
                        
            }
        }
    }
}