<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ownerdata.aspx.cs" Inherits="GasMileageWeb.Ownerdata" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formOwnerdata" runat="server">
     <div>
        <h1>Gridview Owner Data<asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></h1><br />         
        <uc1:Menu runat="server" ID="Menu" />
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
    </div>
    </form>
</body>
</html>
