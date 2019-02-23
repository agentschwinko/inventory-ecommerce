<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thankYou.aspx.cs" Inherits="AtlasOnlineMarket.Buyer.thankYou" %>

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
        .auto-style1 {
            color: white;
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
<body class="bg">
    <div >
    <form id="form1" runat="server">

        <ul>
                <li><a href="mainPage.aspx">Home</a></li>
                <li><a href="orderMan.aspx">Order History</a></li>
                 <li><asp:LinkButton ID="lbtnSignOut" runat="server" ForeColor="White" OnClick="lbtnSignOut_Click">Sign Out</asp:LinkButton>
                </li>
        </ul>

        <div class="a">
        <br />
        <br />
        <br />
        <h1 class="auto-style1">THANK YOU</h1>
        <br />
        
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Your order has been placed." ForeColor="White"></asp:Label>
        <br />
        <br />
        <br />
            <br />
            <br />
        <br />
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>



    </form>
        </div>
</body>
</html>