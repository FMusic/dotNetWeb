<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="adminLogin"
                OnAuthenticate="adminLogin_Authenticate"
                runat="server"
                InstructionText="Hello Admin, type in your username and password"
                BorderStyle="Solid"
                Font-Size="0.8em"
                Style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderWidth="1px" Font-Names="Verdana" ForeColor="#333333">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black"></InstructionTextStyle>
                <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775"></LoginButtonStyle>
                <TextBoxStyle Font-Size="0.8em"></TextBoxStyle>
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White"></TitleTextStyle>
            </asp:Login>
        </div>
    </form>
</body>
</html>
