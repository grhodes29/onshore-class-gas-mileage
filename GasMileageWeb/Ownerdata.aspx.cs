namespace GasMileageWeb
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using GasMileageBLL;
       
    public partial class Ownerdata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = new User();
            u = (User)Session["USER"];
            
            
            if (!IsPostBack)
            {
                FillOwnerGrid();
                
                

                if (u.USERTYPE == "ADMIN")
                {
                    gvOWNER.Visible = true;
                }
                else 
                {
                    gvOWNER.Visible = false; 
                }
            }
        }

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



        //protected void gvOWNER_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
        //        if (ddlDepartment != null)
        //        {
        //            ddlDepartment.DataSource = new mainSQL().getDepartmentList();
        //            ddlDepartment.DataBind();
        //            ddlDepartment.SelectedValue = gvEG.DataKeys[e.Row.RowIndex].Values[1].ToString();
        //        }
        //    }
        //    if (e.Row.RowType == DataControlRowType.EmptyDataRow)
        //    {
        //        DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
        //        if (ddlDepartment != null)
        //        {
        //            ddlDepartment.DataSource = new mainSQL().getDepartmentList();
        //            ddlDepartment.DataBind();
        //        }
        //    }
        //    else if (e.Row.RowType == DataControlRowType.Footer)
        //    {
        //        DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
        //        ddlDepartment.DataSource = new mainSQL().getDepartmentList(); ;
        //        ddlDepartment.DataBind();
        //    }
        //}

    }
}