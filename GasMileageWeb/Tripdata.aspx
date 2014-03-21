<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tripdata.aspx.cs" Inherits="GasMileageWeb.Tripdata" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formTripData" runat="server">
    <div>
        <h1>Gridview Trip Data</h1>
        <uc1:Menu runat="server" ID="Menu" />
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
