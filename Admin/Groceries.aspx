<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Groceries.aspx.cs" Inherits="Admin.Groceries" %>

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
            <div class="">
                <h1>Groceries</h1>
            </div>
            <div class="table-responsive">
                <asp:PlaceHolder runat="server" ID="tblGroceries" />
            </div>
            <div>
                <div class="">
                    <h2 style="margin-top: 150px;">Add New</h2>
                </div>
                <div style="margin:30px;">
                    <div class="form-group">
                        <asp:Label ID="lblName" AssociatedControlID="tbName" Text="Grocerie name:" runat="server" />
                        <asp:TextBox ID="tbName" runat="server" CssClass="form-control"/>
                    </div>
                    <div>
                        <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblQuantity" AssociatedControlID="tbQuantity" Text="Quantity" runat="server" />
                        <asp:TextBox ID="tbQuantity" runat="server" CssClass="form-control" />
                    </div>
                    <div>
                        <asp:DropDownList ID="ddlMeasuringUnit" runat="server" CssClass="form-control" />
                    </div>
                    <asp:Button style="margin-top:30px;" CssClass="btn-primary btn form-control" Text="Submit" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
