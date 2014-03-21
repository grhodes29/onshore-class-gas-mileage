namespace GasMileageWeb
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;

    public class CarForDropDown
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    
    
    public partial class Tripdata : System.Web.UI.Page
    {

        protected List<CarForDropDown> getCarsForDropDown()
        {
            List<CarForDropDown> cList = new List<CarForDropDown>();

            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            cl = objCar.GetAllBusObjCars(); ;

            // get the owers for my dropdown
            MileageBusObj objMileage = new MileageBusObj();
            List<Mileage> ml = new List<Mileage>();
            ml = objMileage.GetAllBusObjMileages();

            var queryList = ((from c in cl
                              join m in ml on c.PK_CAR_ID equals m.FK_CAR_ID
                              select new
                              {
                                  m.FK_CAR_ID,
                                  CAR = c.VIN + " " + c.MAKE  + " " + c.MODEL + " " + c.YEAR 
                                        }).Distinct()).ToList();

            foreach (var element in queryList)
            {
                CarForDropDown obj = new CarForDropDown();
                obj.Id = element.FK_CAR_ID;
                obj.Name = element.CAR;
                cList.Add(obj);

            }

            return cList;
        }
        
        
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillTripGrid();

            } 

        }

        private void FillTripGrid()
        {
            // get the cars for my gridview
            MileageBusObj TripObj = new MileageBusObj();
            List<Mileage> ml = new List<Mileage>();
            ml = TripObj.GetAllBusObjMileages();


            gvTrip.DataSource = ml;
            gvTrip.DataBind();


        }

        protected void gvTrip_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("Insert"))
            {
                Mileage m = new Mileage();
                // TODO - NEED THE DROPDOWN FOR ALL OWNER OR OWNERS TO BE ABLE TO SET THE FOREIGN KEY
                m.FK_CAR_ID = Convert.ToInt32(((DropDownList)gvTrip.FooterRow.FindControl("ddlCar")).SelectedValue);
                m.FILLUPDATE = Convert.ToDateTime(((TextBox)gvTrip.FooterRow.FindControl("txtFILLUPDATE")).Text);
                m.STARTDISTANCE = Convert.ToInt32(((TextBox)gvTrip.FooterRow.FindControl("txtSTARTDISTANCE")).Text);
                m.ENDDISTANCE = Convert.ToInt32(((TextBox)gvTrip.FooterRow.FindControl("txtENDDISTANCE")).Text);
                m.PRICEPERGALLON = Convert.ToDouble(((TextBox)gvTrip.FooterRow.FindControl("txtPRICEPERGALLON")).Text);
                m.GALLONS = Convert.ToDouble(((TextBox)gvTrip.FooterRow.FindControl("txtGALLONS")).Text);

                // need to add this owner
                MileageBusObj mileageObj = new MileageBusObj();
                var result = mileageObj.AddBusObjMileage(m);

                // refill the gridview with new owner
                FillTripGrid();
            }

        }

        protected void gvTrip_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTrip.EditIndex = e.NewEditIndex;
            FillTripGrid();
        }

        protected void gvTrip_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Mileage m = new Mileage();
            m.PK_CARMILEAGE_ID = Convert.ToInt32(gvTrip.DataKeys[e.RowIndex].Values[0].ToString());
            m.FILLUPDATE = Convert.ToDateTime(((TextBox)gvTrip.Rows[e.RowIndex].FindControl("txtFILLUPDATE")).Text);
            m.STARTDISTANCE = Convert.ToInt32(((TextBox)gvTrip.Rows[e.RowIndex].FindControl("txtSTARTDISTANCE")).Text);
            m.ENDDISTANCE = Convert.ToInt32(((TextBox)gvTrip.Rows[e.RowIndex].FindControl("txtENDDISTANCE")).Text);
            m.PRICEPERGALLON = Convert.ToDouble(((TextBox)gvTrip.Rows[e.RowIndex].FindControl("txtPRICEPERGALLON")).Text);
            m.GALLONS = Convert.ToDouble(((TextBox)gvTrip.Rows[e.RowIndex].FindControl("txtGALLONS")).Text);

            
            // need to update this owner
            MileageBusObj tripObj = new MileageBusObj();
            var result = tripObj.UpdateBusObjMileage(m);

            gvTrip.EditIndex = -1;
            FillTripGrid();

        }

        protected void gvTrip_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            gvTrip.EditIndex = -1;
            FillTripGrid();

        }

        protected void gvTrip_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            // get the pk of the owner to delete
            Int32 ID = Convert.ToInt32(gvTrip.DataKeys[e.RowIndex].Values[0].ToString());

            // do the delete using the repository
            MileageBusObj objCar = new MileageBusObj();
            var result = objCar.DeleteBusObjMileage(ID);

            // refill after deleteing
            FillTripGrid();

        }

        protected void gvTrip_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            List<CarForDropDown> o = new List<CarForDropDown>();
            o = getCarsForDropDown();
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
                DropDownList ddlCar = (DropDownList)e.Row.FindControl("ddlCar");
                if (ddlCar != null)
                {
                    ddlCar.DataSource = getCarsForDropDown();
                    ddlCar.DataValueField = "Id";
                    ddlCar.DataTextField = "Name";
                    ddlCar.DataBind();
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlCar = (DropDownList)e.Row.FindControl("ddlCar");
                ddlCar.DataSource = getCarsForDropDown();
                ddlCar.DataValueField = "Id";
                ddlCar.DataTextField = "Name";
                ddlCar.DataBind();
            }
        }


    }
}