<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AtlasOnlineMarket.login" %>

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
                <li><a class="active" href="landingPage.aspx">HOME</a></li>
            </ul>

        <div class="a">
        <br />
        <br />
        <br />
        <h1 style="color:white;">LOGIN</h1>
        <br />
        
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Username:" ForeColor="White"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="*Username Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password:" ForeColor="White"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        </div>



    </form>
        </div>
</body>
</html>

