using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GasMileageBLL;

namespace GasMileageWeb
{

  
    
    public partial class Data : System.Web.UI.Page
    {

        public class OwnerForDropDown
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }


        public class CarForDropDown
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }
        
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                

                User u = new User();
                u = (User)Session["USER"];
                lblWelcome.Text = "Welcome " + u.FNAME + " " + u.LNAME;


                


                if (u.USERTYPE == "ADMIN")
                {
                    FillOwnerGrid();
                    gvOWNER.Visible = true;
                    LitOWNERS.Visible = true;
                    FillCarGrid();
                    FillTripGrid();
                    
                }
                else
                {
                    gvOWNER.Visible = false;
                    LitOWNERS.Visible = false;
                    FillCarGrid(u);
                    FillTripGrid(u);
                }
            }



        }



        /*********************   OWNER GRIDVIEW *****************************************/

        private void FillOwnerGrid()
        {
            OwnerBusObj obj = new OwnerBusObj();
            List<Owner> ol = new List<Owner>();

            ol = obj.GetAllBusObjOwners();

            gvOWNER.DataSource = ol;
            gvOWNER.DataBind();
        }

        protected void gvOWNER_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            // get the pk of the owner to delete
            Int32 ID = Convert.ToInt32(gvOWNER.DataKeys[e.RowIndex].Values[0].ToString());

            OwnerBusObj obj = new OwnerBusObj();
            var result = obj.DeleteBusObjOwner(ID);

            // refill after deleting
            FillOwnerGrid();

        }

        protected void gvOWNER_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("Insert"))
            {

                Owner o = new Owner();
                o.FNAME = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtFNAME")).Text);
                o.LNAME = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtLNAME")).Text);
                o.ADDRESS = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtADDRESS")).Text);
                o.CITY = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtCITY")).Text);
                o.STATE = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtSTATE")).Text);
                o.ZIPMAIN = Convert.ToInt32(((TextBox)gvOWNER.FooterRow.FindControl("txtZIPMAIN")).Text);
                o.USERTYPE = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtUSERTYPE")).Text);
                o.USERID = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtUSERID")).Text);
                o.PASSWORD = Convert.ToString(((TextBox)gvOWNER.FooterRow.FindControl("txtPASSWORD")).Text);

                OwnerBusObj obj = new OwnerBusObj();
                var result = obj.AddBusObjOwner(o);

                // refill the gridview with new owner
                FillOwnerGrid();
            }
        }

        protected void gvOWNER_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOWNER.EditIndex = e.NewEditIndex;
            FillOwnerGrid();

        }

        protected void gvOWNER_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Owner o = new Owner();
            o.PK_OWNER_ID = Convert.ToInt32(gvOWNER.DataKeys[e.RowIndex].Values[0].ToString());
            o.FNAME = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtFNAME")).Text);
            o.LNAME = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtLNAME")).Text);
            o.ADDRESS = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtADDRESS")).Text);
            //// TODO - can you pull the cities from a web service??
            o.CITY = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtCITY")).Text);
            //// TODO - make state into a dropown
            o.STATE = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtSTATE")).Text);
            o.ZIPMAIN = Convert.ToInt32(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtZIPMAIN")).Text);
            o.USERTYPE = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtUSERTYPE")).Text);
            o.USERID = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtUSERID")).Text);
            o.PASSWORD = Convert.ToString(((TextBox)gvOWNER.Rows[e.RowIndex].FindControl("txtPASSWORD")).Text);

            OwnerBusObj obo = new OwnerBusObj();
            var result = obo.UpdateBusObjOwner(o);

            gvOWNER.EditIndex = -1;
            FillOwnerGrid();
        }

        protected void gvOWNER_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOWNER.EditIndex = -1;
            FillOwnerGrid();
        }




        /*********************   CAR GRIDVIEW *****************************************/



        protected List<OwnerForDropDown> getOwnerForDropDown()
        {
            List<OwnerForDropDown> oList = new List<OwnerForDropDown>();


            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            cl = objCar.GetAllBusObjCars(); ;

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





        private void FillCarGrid()
        {
            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            cl = objCar.GetAllBusObjCars();


            gvCar.DataSource = cl;
            gvCar.DataBind();


        }


        ///<summary>
        /// Overload for regular user type which should only see their cars
        ///</summary>
        ///<remarks>
        /// Some remarks
        ///</remarks>
        ///<param name="u">User u</param>
        ///<return>void</return>
        private void FillCarGrid(User u)
        {
            // get the cars for my gridview
            CarBusObj objCar = new CarBusObj();
            List<Car> cl = new List<Car>();
            int i = Convert.ToInt32(u.OWNERTABLEID);
           
            cl = objCar.GetAllBusObjCars();
            cl = cl.Where(x => x.FK_OWNER_ID == i).ToList();

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




        /*********************   TRIP GRIDVIEW *****************************************/





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
                                  CAR = c.VIN + " " + c.MAKE + " " + c.MODEL + " " + c.YEAR
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


        private void FillTripGrid()
        {
            // get the cars for my gridview
            MileageBusObj TripObj = new MileageBusObj();
            List<Mileage> ml = new List<Mileage>();
            ml = TripObj.GetAllBusObjMileages();


            gvTrip.DataSource = ml;
            gvTrip.DataBind();


        }

        private void FillTripGrid(User u)
        {
            // get the cars for my gridview
            MileageBusObj TripObj = new MileageBusObj();
            List<Mileage> ml = new List<Mileage>();
            int i = Convert.ToInt32(u.OWNERTABLEID);
            ml = TripObj.GetAllBusObjMileages();

            // TODO need to have all the cars pks for this user
            //ml = ml.Where(x => x.)
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