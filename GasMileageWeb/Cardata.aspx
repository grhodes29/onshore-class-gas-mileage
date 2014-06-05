<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cardata.aspx.cs" Inherits="GasMileageWeb.Cardata" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Welcome.ascx" TagPrefix="uc1" TagName="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formCarData" runat="server">
    <div>       
        <uc1:Welcome runat="server" ID="Welcome" />
        <uc1:Menu runat="server" ID="Menu" />
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

    </div>
    </form>
</body>
</html>
