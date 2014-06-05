<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dataadmin.aspx.cs" Inherits="GasMileageWeb.Data" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/MenuNew.ascx" TagPrefix="uc1" TagName="MenuNew" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formData" runat="server">
    <div>
    <h1><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></h1><br />
    <uc1:MenuNew runat="server" ID="MenuNew" /> 
             
    <asp:Literal ID="LitOWNERS" runat="server"><h2>OWNERS</h2></asp:Literal>
    <asp:GridView ID="gvOWNER" runat="server" AutoGenerateColumns="False" CssClass="grid"
            AlternatingRowStyle-CssClass="gridEditRow" RowStyle-CssClass="gridRow" ShowFooter="True"
            EditRowStyle-CssClass="gridEditRow" FooterStyle-CssClass="gridFooterRow" OnRowDeleting="gvOWNER_RowDeleting"
            OnRowCommand="gvOWNER_RowCommand" OnRowEditing="gvOWNER_RowEditing" OnRowUpdating="gvOWNER_RowUpdating" 
            OnRowCancelingEdit="gvOWNER_RowCancelingEdit" DataKeyNames="PK_OWNER_ID">
            
            <Columns>
                
                <asp:TemplateField HeaderText="First Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFNAME" runat="server" Text='<%# Bind("FNAME") %>'
                            Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFNAME" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtFNAME" ErrorMessage="Please Enter First Name" ToolTip="Please Enter First Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFNAME" runat="server" Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFNAME" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtFNAME" ErrorMessage="Please Enter First Name" ToolTip="Please Enter First Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("FNAME") %>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Last Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLNAME" runat="server" Text='<%# Bind("LNAME") %>'
                            Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLNAME" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtLNAME" ErrorMessage="Please Enter Last Name" ToolTip="Please Enter Last Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLNAME" runat="server" Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLNAME" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtLNAME" ErrorMessage="Please Enter Last Name" ToolTip="Please Last First Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("LNAME") %>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtADDRESS" runat="server" Text='<%# Bind("ADDRESS") %>'
                            Width="100px" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvADDRESS" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtADDRESS" ErrorMessage="Please Enter Address" ToolTip="Please Enter Address"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtADDRESS" runat="server" Width="100px" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvADDRESS" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtADDRESS" ErrorMessage="Please Enter Address" ToolTip="Please Enter Address"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("ADDRESS") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCITY" runat="server" Text='<%# Bind("CITY") %>'
                            Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCITY" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtCITY" ErrorMessage="Please Enter City" ToolTip="Please Enter City"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCITY" runat="server" Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCITY" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtCITY" ErrorMessage="Please Enter City" ToolTip="Please Enter City"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("CITY") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="State" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSTATE" runat="server" Text='<%# Bind("STATE") %>'
                            Width="100px" MaxLength="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSTATE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtSTATE" ErrorMessage="Please Enter State" ToolTip="Please Enter State"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSTATE" runat="server" Width="100px" MaxLength="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSTATE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtSTATE" ErrorMessage="Please Enter State" ToolTip="Please Enter State"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("STATE") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Main Zip" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtZIPMAIN" runat="server" Text='<%# Bind("ZIPMAIN") %>'
                            Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZIPMAIN" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtZIPMAIN" ErrorMessage="Please Enter Main Zip" ToolTip="Please Enter Main Zip"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtZIPMAIN" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZIPMAIN" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtZIPMAIN" ErrorMessage="Please Enter Main Zip" ToolTip="Please Enter Main Zip"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("ZIPMAIN") %>
                    </ItemTemplate>
                </asp:TemplateField>

                  <asp:TemplateField HeaderText="User Type" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUSERTYPE" runat="server" Text='<%# Bind("USERTYPE") %>'
                            Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUSERTYPE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtUSERTYPE" ErrorMessage="Please Enter User Type - ADMIN or REGULAR" ToolTip="Please Enter User Type - ADMIN or REGULAR"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUSERTYPE" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUSERTYPE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtUSERTYPE" ErrorMessage="Please Enter User Type - ADMIN or REGULAR" ToolTip="Please Enter User Type - ADMIN or REGULAR"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("USERTYPE") %>
                    </ItemTemplate>
                </asp:TemplateField>

                   <asp:TemplateField HeaderText="User ID" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUSERID" runat="server" Text='<%# Bind("USERID") %>'
                            Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUSERID" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtUSERID" ErrorMessage="Please Enter User ID" ToolTip="Please Enter User ID"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUSERID" runat="server" Width="100px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUSERID" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtUSERID" ErrorMessage="Please Enter User ID" ToolTip="Please Enter User ID"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("USERID") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPASSWORD" runat="server" Text='<%# Bind("PASSWORD") %>'
                            Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPASSWORD" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtPASSWORD" ErrorMessage="Please Enter Password" ToolTip="Please Enter Password"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPASSWORD" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPASSWORD" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtPASSWORD" ErrorMessage="Please Enter Password" ToolTip="Please Enter Password"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("PASSWORD") %>
                    </ItemTemplate>
                </asp:TemplateField>




                <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" OnClientClick="return confirm('Update?')" ValidationGroup="Update"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsUpdate" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Update" Enabled="true" HeaderText="Validation Summary..." />
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="True" CommandName="Insert"
                            ValidationGroup="Insert" Text="Insert"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsInsert" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Insert" Enabled="true" HeaderText="Validation..." />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Delete?')"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

            </Columns>

            <EmptyDataTemplate>
                <table class="grid" cellspacing="0" rules="all" border="1" id="gvOWNER" style="border-collapse: collapse;">
                    <tr>
                        <th align="left" scope="col">
                            First Name
                        </th>
                        <th align="left" scope="col">
                            Last Name
                        </th>
                        <th align="left" scope="col">
                            Address
                        </th>
                        <th align="left" scope="col">
                            City
                        </th>
                        <th align="left" scope="col">
                            State
                        </th>
                        <th align="left" scope="col">
                            Zip Main
                        </th>
                         <th align="left" scope="col">
                            User Type
                        </th>
                         <th align="left" scope="col">
                            User ID
                        </th>
                         <th align="left" scope="col">
                            Password
                        </th>
                        <th scope="col">
                            Edit
                        </th>
                        <th scope="col">
                            Delete
                        </th>
                    </tr>
                    <tr class="gridRow">
                        <td colspan="11">
                            No Records found...
                        </td>
                    </tr>
                    <tr class="gridFooterRow">
                        <td>
                            <asp:TextBox ID="txtFNAME" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLNAME" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtADDRESS" runat="server" MaxLength="100"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCITY" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSTATE" runat="server" MaxLength="2"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZIPMAIN" runat="server" MaxLength="5"></asp:TextBox>
                        </td>
                                                <td>
                            <asp:TextBox ID="txtUSERTYPE" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                                                <td>
                            <asp:TextBox ID="txtUSERID" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                                                <td>
                            <asp:TextBox ID="txtPASSWORD" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td colspan="2" align="justify" valign="middle">
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="false" CommandName="emptyInsert"
                                Text="emptyInsert"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <br />
        <br />

        <h2>CARS</h2>   
        <asp:GridView ID="gvCar" runat="server" AutoGenerateColumns="false" CssClass="grid" OnRowCommand="gvCar_RowCommand"
        OnRowEditing="gvCar_RowEditing" OnRowUpdating="gvCar_RowUpdating" OnRowCancelingEdit="gvCar_RowCancelingEdit" 
        OnRowDeleting="gvCar_RowDeleting"  DataKeyNames="PK_CAR_ID" ShowFooter="true" OnRowDataBound="gvCar_RowDataBound"
        AlternatingRowStyle-CssClass="gridEditRow" FooterStyle-CssClass="gridFooterRow" EditRowStyle-CssClass="gridEditRow" 
        RowStyle-CssClass="gridRow" >
   
        <Columns>
            
                <asp:TemplateField HeaderText="Owner" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlOwner" runat="server" DataTextField="NAME" DataValueField="FK_OWNER_ID" AppendDataBoundItems="true"></asp:DropDownList>      
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFkOwner" runat="server" Text='<%# Eval("FK_OWNER_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                                    
                
                <asp:TemplateField HeaderText="VIN" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtVIN" runat="server" Text='<%# Bind("VIN") %>'
                            Width="100px" MaxLength="17"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVIN" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtVIN" ErrorMessage="Please Enter VIN of Car" ToolTip="Please Enter VIN of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtVIN" runat="server" Width="100px" MaxLength="17"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVIN" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtVIN" ErrorMessage="Please Enter VIN of Car" ToolTip="Please Enter VIN of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("VIN")  %>
                    </ItemTemplate>
                </asp:TemplateField>  
                    
            
               <asp:TemplateField HeaderText="Make" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMAKE" runat="server" Text='<%# Bind("MAKE") %>'
                            Width="100px" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMAKE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtMAKE" ErrorMessage="Please Enter Make of Car" ToolTip="Please Enter Make of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMAKE" runat="server" Width="100px" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMAKE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtMAKE" ErrorMessage="Please Enter Make of Car" ToolTip="Please Enter Make of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("MAKE") %>
                    </ItemTemplate>
                </asp:TemplateField>   

            <asp:TemplateField HeaderText="Model" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMODEL" runat="server" Text='<%# Bind("MODEL") %>'
                            Width="100px" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMODEL" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtMODEL" ErrorMessage="Please Enter Model of Car" ToolTip="Please Enter Model of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMODEL" runat="server" Width="100px" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMODEL" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtMODEL" ErrorMessage="Please Enter Model of Car" ToolTip="Please Enter Model of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("MODEL") %>
                    </ItemTemplate>
                </asp:TemplateField>  


            <asp:TemplateField HeaderText="Year" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYEAR" runat="server" Text='<%# Bind("YEAR") %>'
                            Width="100px" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvYEAR" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtYEAR" ErrorMessage="Please Enter Year of Car" ToolTip="Please Enter Year of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>                
                        <asp:RegularExpressionValidator ID="RegExpValtxtYEAR" ValidationGroup="Update" runat="server" 
                            ErrorMessage="Year of Car Must 4 Digit Number" ToolTip="Year of Car Must 4 Digit Number" ValidationExpression="^\d+" 
                            ControlToValidate="txtYEAR" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtYEAR" runat="server" Width="100px" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvYEAR" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtYEAR" ErrorMessage="Please Enter Year of Car" ToolTip="Please Enter Year of Car"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExpValtxtYEAR" ValidationGroup="Insert" runat="server" 
                            ErrorMessage="Year of Car Must 4 Digit Number" ToolTip="Year of Car Must 4 Digit Number" ValidationExpression="^\d+" 
                            ControlToValidate="txtYEAR" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("YEAR") %>
                    </ItemTemplate>
                </asp:TemplateField>  
                      
    
                <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" OnClientClick="return confirm('Update?')" ValidationGroup="Update"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsUpdate" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Update" Enabled="true" HeaderText="Validation Summary..." />
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="True" CommandName="Insert"
                            ValidationGroup="Insert" Text="Insert"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsInsert" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Insert" Enabled="true" HeaderText="Validation..." />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Delete?')"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>            
                        
        </Columns>

           <EmptyDataTemplate>
                <table class="grid" cellspacing="0" rules="all" border="1" id="gvCar" style="border-collapse: collapse;">
                    <tr>
                        <th align="left" scope="col">
                            Owner
                        </th>
                        <th align="left" scope="col">
                            VIN
                        </th>
                        <th align="left" scope="col">
                            Make
                        </th>
                        <th align="left" scope="col">
                            Model
                        </th>
                        <th align="left" scope="col">
                            Year
                        </th>                       
                        <th scope="col">
                            Edit
                        </th>
                        <th scope="col">
                            Delete
                        </th>
                    </tr>
                    <tr class="gridRow">
                        <td colspan="7">
                            No Records found...
                        </td>
                    </tr>
                    <tr class="gridFooterRow">
                        <td>
                            <asp:DropDownList ID="ddlOwner" runat="server" DataTextField="NAME" DataValueField="FK_OWNER_ID" AppendDataBoundItems="true"></asp:DropDownList>
                        </td>                       
                        <td>
                            <asp:TextBox ID="txtVIN" runat="server" MaxLength="17"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMAKE" runat="server" MaxLength="25"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMODEL" runat="server" MaxLength="25"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtYEAR" runat="server" MaxLength="4"></asp:TextBox>
                        </td>                     
                        <td colspan="2" align="justify" valign="middle">
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="false" CommandName="emptyInsert"
                                Text="emptyInsert"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>

    </asp:GridView>
    <br />
    <br />
    <br />     
     <h2>TRIPS FOR CARS</h2>        
     <asp:GridView ID="gvTrip" runat="server" AutoGenerateColumns="false" CssClass="grid" DataKeyNames="PK_CARMILEAGE_ID" ShowFooter="true" 
        AlternatingRowStyle-CssClass="gridEditRow" FooterStyle-CssClass="gridFooterRow" EditRowStyle-CssClass="gridEditRow" 
        RowStyle-CssClass="gridRow" OnRowCommand="gvTrip_RowCommand" OnRowEditing="gvTrip_RowEditing" OnRowUpdating="gvTrip_RowUpdating" 
            OnRowCancelingEdit="gvTrip_RowCancelingEdit" OnRowDeleting="gvTrip_RowDeleting" OnRowDataBound="gvTrip_RowDataBound"  >
   
        <Columns>
            
                <asp:TemplateField HeaderText="Car" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlCar" runat="server" DataTextField="CAR" DataValueField="FK_CAR_ID" AppendDataBoundItems="true"></asp:DropDownList>      
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFkOwner" runat="server" Text='<%# Eval("FK_CAR_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                                    
                
                <asp:TemplateField HeaderText="Fill Up Date" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFILLUPDATE" runat="server" Text='<%# Bind("FILLUPDATE","{0:MM-dd-yyyy}") %>'
                            Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFILLUPDATE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtFILLUPDATE" ErrorMessage="Please Enter Fill Up Date" ToolTip="Please Enter Fill Up Date"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFILLUPDATE" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFILLUPDATE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtFILLUPDATE" ErrorMessage="Please Enter Fill Up Date" ToolTip="Please Enter Fill Up Date"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("FILLUPDATE","{0:MM-dd-yyyy}")  %>
                    </ItemTemplate>
                </asp:TemplateField>  
                    
            
               <asp:TemplateField HeaderText="Start Distance" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSTARTDISTANCE" runat="server" Text='<%# Bind("STARTDISTANCE") %>'
                            Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSTARTDISTANCE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtSTARTDISTANCE" ErrorMessage="Please Enter Start Distance" ToolTip="Please Enter Start Distance"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSTARTDISTANCE" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSTARTDISTANCE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtSTARTDISTANCE" ErrorMessage="Please Enter Start Distance" ToolTip="Please Enter Start Distance"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("STARTDISTANCE") %>
                    </ItemTemplate>
                </asp:TemplateField>   

            <asp:TemplateField HeaderText="End Distance" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtENDDISTANCE" runat="server" Text='<%# Bind("ENDDISTANCE") %>'
                            Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvENDDISTANCE" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtENDDISTANCE" ErrorMessage="Please Enter End Distance" ToolTip="Please Enter End Distance"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtENDDISTANCE" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvENDDISTANCE" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtENDDISTANCE" ErrorMessage="Please Enter End Distance" ToolTip="Please Enter End Distance"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("ENDDISTANCE") %>
                    </ItemTemplate>
                </asp:TemplateField>  


            <asp:TemplateField HeaderText="Price Per Gallon" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPRICEPERGALLON" runat="server" Text='<%# Bind("PRICEPERGALLON", "{0:0.00}") %>'
                            Width="100px" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtPRICEPERGALLON" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtPRICEPERGALLON" ErrorMessage="Price Per Gallon Must be in the format in #.##" 
                            ToolTip="Price Per Gallon Must be in the format in #.##"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExValtxtPRICEPERGALLON" ValidationGroup="Update" runat="server"  
                               ErrorMessage="Price Per Gallon Must be in the format in #.##" ToolTip="Price Per Gallon Must be in the format in #.##"
                               ControlToValidate  ="txtPRICEPERGALLON" 
                               ValidationExpression="^\d{1}(\.\d{2})?$" SetFocusOnError="true" ForeColor="Red">*</asp:RegularExpressionValidator> 
                                     
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPRICEPERGALLON" runat="server" Width="100px" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPRICEPERGALLON" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtPRICEPERGALLON" ErrorMessage="Price Per Gallon Must be in the format in #.##" ToolTip="Price Per Gallon Must be in the format in #.##"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegExValtxtPRICEPERGALLON"  ValidationGroup="Insert" runat="server"  
                               ErrorMessage="Price Per Gallon Must be in the format in #.##" ToolTip="Price Per Gallon Must be in the format in #.##"
                               ControlToValidate  ="txtPRICEPERGALLON" 
                               ValidationExpression="^\d{1}(\.\d{2})?$" SetFocusOnError="true" ForeColor="Red">*</asp:RegularExpressionValidator> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("PRICEPERGALLON", "{0:0.00}") %>
                    </ItemTemplate>
                </asp:TemplateField>  
          



            <asp:TemplateField HeaderText="Gallons" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGALLONS" runat="server" Text='<%# Bind("GALLONS", "{0:0.00}") %>'
                            Width="100px" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtGALLONS" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtGALLONS" ErrorMessage="Gallons Must be in the format in #.##" 
                            ToolTip="Gallons Must be in the format in #.##"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>                
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtGALLONS" runat="server" Width="100px" MaxLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGALLONS" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtGALLONS" ErrorMessage="Gallon Must be in the format in #.##" 
                            ToolTip="Gallons Must be in the format in #.##"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("GALLONS", "{0:0.00}") %>
                    </ItemTemplate>
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="MPG" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="lblMPG" runat="server" Text='<%# Eval("MPG", "{0:0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  



                <asp:TemplateField HeaderText="Fill Up Cost" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="lblFILLUPCOST" runat="server" Text='<%# Eval("FILLUPCOST", "{0:0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  

    
                <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" OnClientClick="return confirm('Update?')" ValidationGroup="Update"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsUpdate" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Update" Enabled="true" HeaderText="Validation Summary..." />
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="True" CommandName="Insert"
                            ValidationGroup="Insert" Text="Insert"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsInsert" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Insert" Enabled="true" HeaderText="Validation..." />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Delete?')"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>            
                        
        </Columns>

           <EmptyDataTemplate>
                <table class="grid" cellspacing="0" rules="all" border="1" id="gvCar" style="border-collapse: collapse;">
                    <tr>
                        <th align="left" scope="col">
                            CAR
                        </th>
                        <th align="left" scope="col">
                            Fill Up Date
                        </th>
                        <th align="left" scope="col">
                            Start Distance
                        </th>
                        <th align="left" scope="col">
                            End Distance
                        </th>
                        <th align="left" scope="col">
                            Price Per Gallon
                        </th>
                        <th align="left" scope="col">
                            Gallons
                        </th>
                        <th align="left" scope="col">
                            MPG
                        </th>
                        <th align="left" scope="col">
                            Fill Up Cost
                        </th>                              
                        <th scope="col">
                            Edit
                        </th>
                        <th scope="col">
                            Delete
                        </th>
                    </tr>
                    <tr class="gridRow">
                        <td colspan="10">
                            No Records found...
                        </td>
                    </tr>
                    <tr class="gridFooterRow">
                        <td>
                            <asp:DropDownList ID="ddlCar" runat="server" DataTextField="CAR" DataValueField="FK_CAR_ID" AppendDataBoundItems="true"></asp:DropDownList>
                        </td>                       
                        <td>
                            <asp:TextBox ID="txtFILLUPDATE" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSTARTDISTANCE" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtENDDISTANCE" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPRICEPERGALLON" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGALLONS" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMPG" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFILLUPCOST" runat="server" MaxLength="6"></asp:TextBox>
                        </td>                        
                        <td colspan="2" align="justify" valign="middle">
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="false" CommandName="emptyInsert"
                                Text="emptyInsert"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>

    </asp:GridView>

    </div>
    </form>
</body>
</html>
