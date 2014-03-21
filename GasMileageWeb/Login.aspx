<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GasMileageWeb.Login" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formLogin" runat="server">   
    <div>
        <h1>Gas Mileage Login</h1>
        <asp:Label ID="lblUser" runat="server" Text="USER"></asp:Label><asp:TextBox ID="txtbxUser" runat="server"></asp:TextBox><br />  
        <asp:Label ID="lblPassword" runat="server" Text="PASSWORD"></asp:Label><asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br />                  
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" /><br />       
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br />       
    </div>
        <asp:HyperLink ID="hyperlnkLogin" runat="server" NavigateUrl="Register.aspx">Are you a new user? Please register</asp:HyperLink>           
    </form>
</body>
</html>
