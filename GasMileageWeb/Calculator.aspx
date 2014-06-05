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
    </div>
    </form>
</body>
</html>
