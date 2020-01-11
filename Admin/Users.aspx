<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Admin.Users" %>

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
            <asp:GridView runat="server"
                            id="usersGrid"
                            AutoGenerateColumns="false"
                            EmptyDataText="No users yet..">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DoB" />
                    <asp:BoundField DataField="Email" HeaderText="E-Mail" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight" />
                    <asp:BoundField DataField="Height" HeaderText="Height" />
                    <asp:BoundField DataField="PhysicalActivity" HeaderText="Phys Activity" />
                    <asp:BoundField DataField="DiabetesType" HeaderText="Diabetes" />
                    <asp:BoundField DataField="Sex" HeaderText="Sex" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
