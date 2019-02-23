<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderMan.aspx.cs" Inherits="AtlasOnlineMarket.Buyer.WebForm1" %>

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
<body>
    <div class="bg">
    <form id="form1" runat="server">
        <ul>

                <li><a class="active" href="#orderMan">Order History</a></li>
                <li><a href="mainPage.aspx">Main Page</a></li>
                <li><asp:LinkButton ID="lbtnSignOut" runat="server" ForeColor="White" OnClick="lbtnSignOut_Click">Sign Out</asp:LinkButton></li>

            </ul>
        <br />

        <div class="a">
            <h1 class="auto-style4">ORDERS HISTORY</h1>
        <br />
        
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="OrderSource" ForeColor="White" Width="1172px">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="DeliveryMethod" HeaderText="DeliveryMethod" SortExpression="DeliveryMethod" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Text="There is no order to display"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <br />
            <asp:ObjectDataSource ID="OrderSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOrders" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.OrdersTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SellerID" Type="Int32" />
                    <asp:Parameter Name="BuyerID" Type="Int32" />
                    <asp:Parameter Name="DeliveryMethod" Type="String" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="bID" SessionField="BuyerID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SellerID" Type="Int32" />
                    <asp:Parameter Name="BuyerID" Type="Int32" />
                    <asp:Parameter Name="DeliveryMethod" Type="String" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        
        <br />
        <br />
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