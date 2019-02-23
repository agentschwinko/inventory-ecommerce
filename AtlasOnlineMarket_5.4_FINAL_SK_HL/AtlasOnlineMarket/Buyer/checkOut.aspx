<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkOut.aspx.cs" Inherits="AtlasOnlineMarket.Buyer.checkOut" %>

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

        .auto-style4 {
            color: #FFFFFF;
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
                <li><a href="mainPage.aspx">Main Page</a></li>
                <li><a href="orderMan.aspx">Order History</a></li>
            <li><asp:LinkButton ID="lbtnSignOut" runat="server" ForeColor="White" OnClick="lbtnSignOut_Click">Sign Out</asp:LinkButton>
                </li>
            </ul>
        <div class="a" style="height: 627px">
        <br />
            <asp:Label ID="Label1" runat="server" ForeColor="White" Text="ORDER SUMMARY"></asp:Label>
            <br />
        <br />
        <br />
            <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Order Number:"></asp:Label>
&nbsp;<asp:Label ID="lblOrd" runat="server" ForeColor="White"></asp:Label>
            <br />
        <br />
            <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Total:"></asp:Label>
&nbsp;<asp:Label ID="lblTotal" runat="server" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="White" Text="Order Date:"></asp:Label>
&nbsp;<asp:Label ID="lblDate" runat="server" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblDel" runat="server" ForeColor="White">Delivery Method: </asp:Label>
            <asp:Label ID="lblDelMe" runat="server" ForeColor="White"></asp:Label>
&nbsp;<br />
            <br />
        <br />
            
            <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Delivery Method"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlDelivery" runat="server" AutoPostBack="True" Height="21px" OnSelectedIndexChanged="ddlDelivery_SelectedIndexChanged" Width="159px">
                <asp:ListItem Value="Pick Up"></asp:ListItem>
                <asp:ListItem Value="Delivery"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
                    <asp:Button ID="btnConf" runat="server" OnClick="btnConf_Click" Text="Confirm" />
                    <br />
            <br />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="White"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            
        </div>



    </form>
        </div>
</body>
</html>
