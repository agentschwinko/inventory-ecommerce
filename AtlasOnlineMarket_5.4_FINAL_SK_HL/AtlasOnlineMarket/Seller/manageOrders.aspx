<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageOrders.aspx.cs" Inherits="AtlasOnlineMarket.manageOrders" %>

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
            height: 26px;
        }
        .auto-style2 {
            width: 100%;
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
    <form id="form1" runat="server">
         <ul>
                <li><a href="manageProduct.aspx">Manage Product</a></li>
                <li><a  href="newProduct.aspx">Add New Product</a></li>
                <li><a  href="newCategory.aspx">Add New Category</a></li>
                <li><a class="active" href="manageOrders.aspx">Manage Orders</a></li>
                <li><a href="../landingPage.aspx">Logout</a></li>
            </ul>
            <br />
        <br />
        <br />
        <div class="a">
        <h1 style="color:white;">Orders Lists</h1>
            <p style="color:white;">
                <table class="auto-style2">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Pending Orders"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:GridView ID="grdPending" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProdID,OrderID,SellerID,BuyerID" DataSourceID="PendingSource" ForeColor="White" OnSelectedIndexChanged="grdPending_SelectedIndexChanged1" Width="1130px" PageSize="5">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" SortExpression="ProdID" Visible="False" />
                                    <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
                                    <asp:BoundField DataField="SellerID" HeaderText="SellerID" ReadOnly="True" SortExpression="SellerID" Visible="False" />
                                    <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                    <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" Visible="False" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                    <asp:BoundField DataField="Total" HeaderText="Item Total" SortExpression="Total" />
                                    <asp:BoundField DataField="OrderTotal" HeaderText="Order Total" SortExpression="OrderTotal" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label4" runat="server" ForeColor="White" Text="No order to display"></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:ObjectDataSource ID="PendingSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetIncompletedOrder" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.OrderProdTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ProdID" Type="Int32" />
                                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                                    <asp:Parameter Name="Original_SellerID" Type="Int32" />
                                    <asp:Parameter Name="Original_BuyerID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProdID" Type="Int32" />
                                    <asp:Parameter Name="OrderID" Type="Int32" />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="SellerID" Type="Int32" />
                                    <asp:Parameter Name="BuyerID" Type="Int32" />
                                    <asp:Parameter Name="ProdName" Type="String" />
                                    <asp:Parameter Name="ProdPrice" Type="Decimal" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="Total" Type="Decimal" />
                                    <asp:Parameter Name="OrderTotal" Type="Decimal" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="stt" SessionField="cStt" Type="String" />
                                    <asp:SessionParameter Name="sid" SessionField="uid" Type="Int32" />
                                    <asp:SessionParameter Name="stt2" SessionField="uStt" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="ProdName" Type="String" />
                                    <asp:Parameter Name="ProdPrice" Type="Decimal" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="Total" Type="Decimal" />
                                    <asp:Parameter Name="OrderTotal" Type="Decimal" />
                                    <asp:Parameter Name="Original_ProdID" Type="Int32" />
                                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                                    <asp:Parameter Name="Original_SellerID" Type="Int32" />
                                    <asp:Parameter Name="Original_BuyerID" Type="Int32" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Completed Orders"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:GridView ID="grdComplete" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProdID,OrderID,SellerID,BuyerID" DataSourceID="CompletedSource" ForeColor="White" Width="1138px" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" SortExpression="ProdID" Visible="False" />
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="SellerID" HeaderText="SellerID" ReadOnly="True" SortExpression="SellerID" Visible="False" />
                                    <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                    <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                                    <asp:BoundField DataField="ProdPrice" HeaderText="Price" SortExpression="ProdPrice" Visible="False" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                    <asp:BoundField DataField="Total" HeaderText="Item Total" SortExpression="Total" />
                                    <asp:BoundField DataField="OrderTotal" HeaderText="Order Total" SortExpression="OrderTotal" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <br />
                                    <asp:Label ID="Label4" runat="server" ForeColor="White" Text="No order to display"></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:ObjectDataSource ID="CompletedSource" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCompletedOrder" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.OrderProdTableAdapter">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ProdID" Type="Int32" />
                                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                                    <asp:Parameter Name="Original_SellerID" Type="Int32" />
                                    <asp:Parameter Name="Original_BuyerID" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="sid" SessionField="uid" Type="Int32" />
                                    <asp:SessionParameter Name="stt" SessionField="cStt" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                </table>
            </p>
        </div>

    </form>
</body>
</html>
        
