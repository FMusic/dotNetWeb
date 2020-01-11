<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeasuringUnits.aspx.cs" Inherits="Admin.MeasuringUnits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="Style/Stylesheet.css" type="text/css" rel="Stylesheet" />
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
            <h1>Measuring Units</h1>
        </div>
        <asp:GridView runat="server"
            ID="unitsGrid"
            AutoGenerateColumns="false"
            EmptyDataText="No measuring units yet..">
            <Columns>
                <asp:BoundField DataField="strings" HeaderText="Units name" />
            </Columns>
        </asp:GridView>
        <div class="newMeasuringUnit">
        <asp:Label Text="New measuring unit:" runat="server" AssociatedControlID="tbNewUnit" />
        <asp:TextBox runat="server" ID="tbNewUnit" />
            <asp:Button Text="Save" runat="server" id="btnSave" OnClick="btnSave_Click" />
            </div>
    </form>
</body>
</html>
