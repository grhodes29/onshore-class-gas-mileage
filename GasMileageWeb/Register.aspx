<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GasMileageWeb.Register" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc1" TagName="Header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Gas Mileage Application</title>
</head>
<body>
    <form id="formRegister" runat="server">
        <h1>Gas Mileage Register New User</h1>
    <div>
        <asp:Label ID="lblFname" runat="server" Text="First Name"></asp:Label><asp:TextBox ID="txtbxFname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxFname" runat="server" ErrorMessage="First Name required" ControlToValidate="txtbxFname"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label><asp:TextBox ID="txtbxLname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxLname" runat="server" ErrorMessage="Last Name required" ControlToValidate="txtbxLname"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label><asp:TextBox ID="txtbxAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxAddress" runat="server" ErrorMessage="Adresss required" ControlToValidate="txtbxAddress"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label><asp:TextBox ID="txtbxCity" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxCity" runat="server" ErrorMessage="City required" ControlToValidate="txtbxCity"></asp:RequiredFieldValidator><br />       
        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label><asp:TextBox ID="txtbxState" runat="server" MaxLength="2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxState" runat="server" ErrorMessage="State required" ControlToValidate="txtbxState"></asp:RequiredFieldValidator><br />        
        <asp:Label ID="lblMainzip" runat="server" Text="Zip Code"></asp:Label><asp:TextBox ID="txtbxZipmain" runat="server" MaxLength="5"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxZipmain" runat="server" ErrorMessage="Zip required" ControlToValidate="txtbxZipmain"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblUsertype" runat="server" Text="User Type"></asp:Label><asp:DropDownList ID="drpdwnlstUsertype" runat="server"></asp:DropDownList><br />
        <asp:Label ID="lblUserid" runat="server" Text="Email Login"></asp:Label><asp:TextBox ID="txtbxUserid" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ReqFieldValtxtbxUserid" runat="server" ErrorMessage="User Email Login required" ControlToValidate="txtbxUserid"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegExValtxtbxUserid" runat="server"  ErrorMessage="Must be a valid email" ControlToValidate="txtbxUserid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label><asp:TextBox ID="txtbxPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RegExValtxtbxPassword" runat="server" ErrorMessage="Password required" ControlToValidate="txtbxPassword"></asp:RequiredFieldValidator><br />
        <asp:Button ID="btnSumit" runat="server" Text="Submit" OnClick="btnSumit_Click" /><asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" /><br />      
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br /> 
    </div>
        <asp:HyperLink ID="hyperlnkLogin" runat="server" NavigateUrl="Login.aspx">Return to login page</asp:HyperLink>
    </form>
</body>
</html>
