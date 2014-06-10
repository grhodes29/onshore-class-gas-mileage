<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="GasMileageWeb.Calculator" %>
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
    <form id="formCalulator" runat="server">
    <div>   
        <uc1:Welcome runat="server" ID="Welcome" />
        <uc1:Menu runat="server" ID="Menu" />
        
        <asp:Repeater ID="RepeaterCalculator" runat="server">
            
            <HeaderTemplate>           
            <table border="1" width="100%">
            <tr>
            <th>Title</th>
            <th>Artist</th>
            <th>Company</th>
            <th>Price</th>
            </tr>
            </HeaderTemplate>

            <ItemTemplate>
            <tr>
            <td><%#Container.DataItem("title")%> </td>
            <td><%#Container.DataItem("artist")%> </td>
            <td><%#Container.DataItem("company")%> </td>
            <td><%#Container.DataItem("price")%> </td>
            </tr>
            </ItemTemplate>

            <FooterTemplate>
            </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>
    </form>
</body>
</html>
