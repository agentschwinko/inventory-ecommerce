<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newProduct.aspx.cs" Inherits="AtlasOnlineMarket.newProduct" %>

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
                <li><a class="active" href="newProduct.aspx">Add New Product</a></li>
                <li><a href="newCategory.aspx">Add New Category</a></li>
                <li><a href="manageOrders.aspx">Manage Orders</a></li>
                <li><a href="../landingPage.aspx">Logout</a></li>
            </ul>
        <div class="a">
        <br />
        <br />
        <br />
        <h1 style="color:white;">New Product</h1>
        <br />
            <asp:Label ID="lblCategory" runat="server" Text="Category:" ForeColor="White"></asp:Label>
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="*Category Must Be Selected" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
&nbsp;<br />
        <br />
            <asp:Label ID="lblName" runat="server" Text="Name:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtName" ErrorMessage="*Product name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Text="Price:" ForeColor="White" ></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="*Price is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrice" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="*Must be numeric with decimal amount" ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
        <br />
        <br />
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorQty" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="*Quantity is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorQty" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="*Numeric input only" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        <br />
        <br />
            <asp:Label ID="lblImage" runat="server" Text="Browse Image:" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUpload" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="*Image is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblSeller" runat="server" ForeColor="White" Text="Seller ID: "></asp:Label>
            <asp:TextBox ID="txtSeller" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSeller" runat="server" ControlToValidate="txtSeller" Display="Dynamic" ErrorMessage="*Seller ID is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorSeller" runat="server" ControlToValidate="txtSeller" Display="Dynamic" ErrorMessage="*Numeric input only - no decimals" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="lblDesc" runat="server" ForeColor="White" Text="Description: "></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesc" runat="server" ControlToValidate="txtDescription" ErrorMessage="*Description Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Label ID="lblMessage2" runat="server"></asp:Label>
        <br />
        <br />
        <br />
            
        </div>



    </form>
        </div>
</body>
</html>
