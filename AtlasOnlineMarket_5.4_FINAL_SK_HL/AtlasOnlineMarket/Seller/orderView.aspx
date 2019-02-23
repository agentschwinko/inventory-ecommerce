<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderView.aspx.cs" Inherits="AtlasOnlineMarket.Seller.orderView" %>

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
<body>
    <div class="bg">
    <form id="form1" runat="server">
          <ul>
                <li><a href="manageProduct.aspx">Manage Product</a></li>
                <li><a href="newProduct.aspx">Add New Product</a></li>
                <li><a href="newCategory.aspx">Add New Category</a></li>
                <li><a class="active" href="manageOrders.aspx">Manage Orders</a></li>
                <li><a href="../landingPage.aspx">Logout</a></li>
            </ul>
            <br />
        <br />
        <br />
        <div class="a">
        <h1 style="color:white;">Manage Order</h1>
            <p style="color:white;">
                <table class="auto-style2">
                    <tr>
                        <td>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="OrderID,BuyerID" DataSourceID="OrderSource" ForeColor="White" Height="50px" Width="125px">
                                <Fields>
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
                                </Fields>
                            </asp:DetailsView>
                            <asp:ObjectDataSource ID="OrderSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetUserOrder" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.UserOrderTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="bid" QueryStringField="oID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProdID,OrderID,SellerID,BuyerID" DataSourceID="OrderMans" ForeColor="White" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1134px" OnRowUpdated="GridView1_RowUpdated">
                                <Columns>
                                    <asp:CommandField EditText="Update Status" ShowEditButton="True" />
                                    <asp:BoundField DataField="ProdID" HeaderText="Product ID" ReadOnly="True" SortExpression="ProdID" />
                                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="SellerID" HeaderText="SellerID" ReadOnly="True" SortExpression="SellerID" Visible="False" />
                                    <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
                                    <asp:BoundField DataField="ProdName" HeaderText="Product Name" ReadOnly="True" SortExpression="ProdName" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
                                    <asp:BoundField DataField="ProdPrice" HeaderText="Price" SortExpression="ProdPrice" Visible="False" />
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" SelectedValue='<%# Bind("Status") %>' Width="136px">
                                                <asp:ListItem Selected="True">Pending</asp:ListItem>
                                                <asp:ListItem>Completed</asp:ListItem>
                                                <asp:ListItem>On Hold</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                                    <asp:BoundField DataField="OrderTotal" HeaderText="Order Total" ReadOnly="True" SortExpression="OrderTotal" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:ObjectDataSource ID="OrderMans" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOrdersForMan" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.OrderProdTableAdapter" UpdateMethod="UpdateStatusOnOrder">
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
                                    <asp:QueryStringParameter Name="oid" QueryStringField="oID" Type="Int32" />
                                    <asp:SessionParameter Name="sid" SessionField="uid" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="Original_ProdID" Type="Int32" />
                                    <asp:Parameter Name="Original_OrderID" Type="Int32" />
                                    <asp:Parameter Name="Original_SellerID" Type="Int32" />
                                    <asp:Parameter Name="Original_BuyerID" Type="Int32" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                </table>
            </p>
        </div>

    </form>
        </div>
</body>
</html>
