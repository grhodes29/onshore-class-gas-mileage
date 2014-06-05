<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="GasMileageWeb.Menu" %>
<br />
<asp:HyperLink ID="hyprlnkCalculator" runat="server" NavigateUrl="Calculator.aspx">Calculator</asp:HyperLink>
<asp:HyperLink ID="hyprlnkOwner" runat="server" NavigateUrl="Ownerdata.aspx">Owner</asp:HyperLink>
<asp:HyperLink ID="hyprlnkCar" runat="server" NavigateUrl="Cardata.aspx">Car</asp:HyperLink>
<asp:HyperLink ID="hyprlnkTrip" runat="server" NavigateUrl="Tripdata.aspx">Trip</asp:HyperLink>
<asp:HyperLink ID="hyprlnkData" runat="server" NavigateUrl="Data.aspx">All</asp:HyperLink>
<asp:HyperLink ID="hyprlnkLogOut" runat="server" NavigateUrl="Login.aspx">Log Out</asp:HyperLink>
<br />
<br />