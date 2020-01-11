<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meals.aspx.cs" Inherits="Admin.Meals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/Stylesheet.css" type="text/css" rel="Stylesheet" />

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
        <h1>Meals</h1>
        <div class="table-responsive">
            <asp:PlaceHolder runat="server" ID="tblMeals" />
        </div>
        <div>
            <h2>Add New</h2>
            <div class="form-group">
                <asp:Label Text="Name" runat="server" AssociatedControlID="tbNameNew" />
                <asp:TextBox runat="server" ID="tbNameNew" />
            </div>
            <div class="form-inline">
                <div>
                    <asp:Label Text="Protein Grocery" runat="server" AssociatedControlID="ddlProtein" />
                    <asp:DropDownList runat="server" ID="ddlProtein" CssClass="form-control"/>
                </div>
                <div>
                    <asp:Label Text="Fat Grocery" runat="server" AssociatedControlID="ddlFat" />
                    <asp:DropDownList runat="server" ID="ddlFat" CssClass="form-control" />
                </div>
                <div>
                    <asp:Label Text="Carb Grocery" runat="server" AssociatedControlID="ddlCarbo" />
                    <asp:DropDownList runat="server" ID="ddlCarbo" CssClass="form-control" />
                </div>
            </div>
            <asp:Button CssClass="btn-primary btn" Text="Submit" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click"/>
        </div>
    </form>
</body>
</html>
