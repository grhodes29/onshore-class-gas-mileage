namespace GasMileageWeb
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;


    public class OwnerForDropDown
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    
    public partial class Cardata : System.Web.UI.Page
    {

        protected List<OwnerForDropDown> getOwnerForDropDown()
        {
            List<OwnerForDropDown> oList = new List<OwnerForDropDown>();
            

            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            cl = objCar.GetAllBusObjCars();;

            // get the owers for my dropdown
            OwnerBusObj objOwner = new OwnerBusObj();
            List<Owner> ol = new List<Owner>();
            ol = objOwner.GetAllBusObjOwners();



            var queryList = ((from o in ol
                              join c in cl on o.PK_OWNER_ID equals c.FK_OWNER_ID
                              select new
                              {
                                  c.FK_OWNER_ID,
                                  NAME = o.FNAME
                                      + " " + o.LNAME
                              }).Distinct()).ToList();

            foreach (var element in queryList)
            {
                OwnerForDropDown obj = new OwnerForDropDown();
                obj.Id = element.FK_OWNER_ID;
                obj.Name = element.NAME;
                oList.Add(obj);
            
            }


            return oList;
        }

   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCarGrid();
               
            } 
        }

        
   

        private void FillCarGrid()
        {            
            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            cl = objCar.GetAllBusObjCars();


            gvCar.DataSource = cl;
            gvCar.DataBind();
      
           
        }



        protected void gvCar_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // get the pk of the owner to delete
            Int32 ID = Convert.ToInt32(gvCar.DataKeys[e.RowIndex].Values[0].ToString());

            // do the delete using the repository
            CarBusObj objCar = new CarBusObj();
            var result = objCar.DeleteBusObjCar(ID);

            // refill after deleteing
            FillCarGrid();
        }



        protected void gvCar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                Car c = new Car();
                // TODO - NEED THE DROPDOWN FOR ALL OWNER OR OWNERS TO BE ABLE TO SET THE FOREIGN KEY
                c.FK_OWNER_ID = Convert.ToInt32(((DropDownList)gvCar.FooterRow.FindControl("ddlOwner")).SelectedValue);
                c.VIN = Convert.ToString(((TextBox)gvCar.FooterRow.FindControl("txtVIN")).Text);
                c.MAKE = Convert.ToString(((TextBox)gvCar.FooterRow.FindControl("txtMAKE")).Text);
                c.MODEL = Convert.ToString(((TextBox)gvCar.FooterRow.FindControl("txtMODEL")).Text);
                c.YEAR = Convert.ToInt32(((TextBox)gvCar.FooterRow.FindControl("txtYEAR")).Text);            

                // need to add this owner
                CarBusObj carObj = new CarBusObj();
                var result = carObj.AddBusObjCar(c);

                // refill the gridview with new owner
                FillCarGrid();
            }
        }

        protected void gvCar_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCar.EditIndex = e.NewEditIndex;
            FillCarGrid();
        }

        protected void gvCar_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Car c = new Car();
            c.PK_CAR_ID = Convert.ToInt32(gvCar.DataKeys[e.RowIndex].Values[0].ToString());
            c.VIN = Convert.ToString(((TextBox)gvCar.Rows[e.RowIndex].FindControl("txtVIN")).Text);
            c.MAKE = Convert.ToString(((TextBox)gvCar.Rows[e.RowIndex].FindControl("txtMAKE")).Text);
            c.MODEL = Convert.ToString(((TextBox)gvCar.Rows[e.RowIndex].FindControl("txtMODEL")).Text);
            c.YEAR = Convert.ToInt32(((TextBox)gvCar.Rows[e.RowIndex].FindControl("txtYEAR")).Text);
         
            // need to update this owner
            CarBusObj carObj = new CarBusObj();
            var result = carObj.UpdateBusObjCar(c);

            gvCar.EditIndex = -1;
            FillCarGrid();
        }

        protected void gvCar_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            gvCar.EditIndex = -1;
            FillCarGrid();
            

        }

        protected void gvCar_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            List<OwnerForDropDown> o = new List<OwnerForDropDown>();
            o = getOwnerForDropDown();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblFkOwner = (Label)e.Row.FindControl("lblFkOwner");
                        if (lblFkOwner != null)
                        {
                            
                            foreach (var element in o) 
                            {
                               
                                if (element.Id == Convert.ToInt32(lblFkOwner.Text))
                                {
                                    lblFkOwner.Text = element.Name;
                                    break;

                                }
                            
                            }
                 
                        }
            }
            if (e.Row.RowType == DataControlRowType.EmptyDataRow)
            {
                DropDownList ddlOwner = (DropDownList)e.Row.FindControl("ddlOwner");
                if (ddlOwner != null)
                {
                    ddlOwner.DataSource = getOwnerForDropDown();
                    ddlOwner.DataValueField = "Id";
                    ddlOwner.DataTextField = "Name";
                    ddlOwner.DataBind();
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlOwner = (DropDownList)e.Row.FindControl("ddlOwner");
                ddlOwner.DataSource = getOwnerForDropDown();
                ddlOwner.DataValueField = "Id";
                ddlOwner.DataTextField = "Name";
                ddlOwner.DataBind();
            }
        }





        //protected void gvCar_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        Label lblOwner = (Label)e.Row.FindControl("lblOwner");
        //        if (lblOwner != null)
        //        {

        //            lblOwner.Text = "TEST";
        //            //lblOwner.DataSource = getOwnerForDropDown();
        //            //lblOwner.DataValueField = "Id";
        //            //lblOwner.DataTextField = "Name";
        //            //lblOwner.DataBind();
        //            //lblOwner.SelectedValue = gvCar.DataKeys[e.Row.RowIndex].Values[0].ToString();
        //        }
        //    }
        //    if (e.Row.RowType == DataControlRowType.EmptyDataRow)
        //    {
        //        DropDownList ddlOwner = (DropDownList)e.Row.FindControl("ddlOwner");
        //        if (ddlOwner != null)
        //        {
        //            {
                        
        //                ddlOwner.DataSource = getOwnerForDropDown();
        //                ddlOwner.DataValueField = "Id";
        //                ddlOwner.DataTextField = "Name";
        //                ddlOwner.DataBind();
        //            }
        //        }
        //        else if (e.Row.RowType == DataControlRowType.Footer)
        //        {
        //            DropDownList ddlOwner = (DropDownList)e.Row.FindControl("ddlOwner");
        //            ddlOwner.DataSource = getOwnerForDropDown();
        //            ddlOwner.DataValueField = "Id";
        //            ddlOwner.DataTextField = "Name";
        //            ddlOwner.DataBind();
        //        }

        //    }
        //}     
    
    }
}