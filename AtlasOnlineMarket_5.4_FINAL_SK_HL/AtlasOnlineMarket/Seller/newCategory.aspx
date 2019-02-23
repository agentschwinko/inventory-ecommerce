<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newCategory.aspx.cs" Inherits="AtlasOnlineMarket.newCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ATLAS</title>
    <style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    /* The image used */
    background-image: url(../img/intro-bg.jpg);

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

div.a {
    text-align: center;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family: Arial, Helvetica, sans-serif;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #41cfd9;
}
</style>
</head>
<body>
    <div class="bg">
    <form id="form1" runat="server">
         <ul>
                <li><a href="manageProduct.aspx">Manage Product</a></li>
                <li><a  href="newProduct.aspx">Add New Product</a></li>
                <li><a class="active" href="newCategory.aspx">Add New Category</a></li>
                <li><a href="manageOrders.aspx">Manage Orders</a></li>
                <li><a href="../landingPage.aspx">Logout</a></li>
            </ul>
        <div class="a">
        <br />
        <br />
        <br />
        <h1 style="color:white;">New Category</h1>
        <br />
            <asp:Label ID="Label1" runat="server" Text="Category Name:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName" Display="Dynamic" ErrorMessage="*Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click1" />
        <br />
        <br />
      
        <br />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnCancel_Click" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Blue"></asp:Label>
        <br />
        <br />
        <br />
            
        </div>



    </form>
        </div>
</body>
</html>

