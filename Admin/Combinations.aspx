<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Combinations.aspx.cs" Inherits="Admin.Combinations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default">
            <ul class="nav navbar-nav">
                <li><a href="#">Admin</a></li>
                <li><a href="Users.aspx">Users</a></li>
                <li><a href="Meals.aspx">Meals</a></li>
                <li><a href="Groceries.aspx">Groceries</a></li>
                <li><a href="MeasuringUnits.aspx">MeasuringUnits</a></li>
                <li><a href="Combinations.aspx">Combinations</a></li>
            </ul>
        </nav>
        <div>
            <h1>Combinations</h1>
            <div class="form-group">
                <asp:Label Text="Choose number of meals:" runat="server" AssociatedControlID="ddlNumberOfMeals" />
                <asp:DropDownList runat="server" ID="ddlNumberOfMeals" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <asp:Label Text="Pick begining date" runat="server" AssociatedControlID="calFrom" />
                    <asp:Calendar ID="calFrom" runat="server" SelectionMode="Day" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Pick ending date" runat="server" AssociatedControlID="calTo" />
                    <asp:Calendar ID="calTo" runat="server" SelectionMode="Day" />
                </div>
            </div>
        </div>
        <div>
            <asp:PlaceHolder runat="server" ID="tblCombinations"/>
        </div>
        <asp:Button Text="Submit" runat="server" CssClass="btn btn-primary" ID="btnSubmit" OnClick="btnSubmit_Click"/>
    </form>
</body>
</html>
