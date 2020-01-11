<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="Admin.MainMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/Stylesheet.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="display:flex;
                    flex-direction:column;
                    justify-content:space-around;
                        ">
            <asp:Button runat="server" ID="btnUsers" Text="Users" CssClass="Buttonz" OnClick="btnUsers_Click"/>
            <asp:Button runat="server" ID="btnGroceries" Text="Groceries" CssClass="Buttonz" OnClick="btnUsers_Click"/>
            <asp:Button runat="server" ID="btnMeals" Text="Meals" CssClass="Buttonz" OnClick="btnUsers_Click"/>
            <asp:Button runat="server" ID="btnMeasuringUnits" Text="Measuring Units" CssClass="Buttonz" OnClick="btnUsers_Click"/> 
            <asp:Button runat="server" ID="btnCombinations" Text="Combinations" CssClass="Buttonz" OnClick="btnUsers_Click"/> 
        </div>
    </form>
</body>
</html>
