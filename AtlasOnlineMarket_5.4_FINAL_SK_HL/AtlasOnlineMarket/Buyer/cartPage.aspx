<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cartPage.aspx.cs" Inherits="AtlasOnlineMarket.Buyer.cartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ATLAS</title>
            <style>

html {
    height: 100%;
    margin: 0;
}

body {
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
                .auto-style2 {
                    height: 26px;
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
                .auto-style3 {
                    height: 26px;
                    width: 453px;
                }
                .auto-style4 {
                    width: 453px;
                }
                .auto-style5 {
                    width: 57px;
                }
            </style>
</head>
<body class="bg" style="text-align:center;">
    <form id="form1" runat="server">
        <ul>
                <li><a class="active" href="mainPage.aspx">Home</a></li>
                 
        </ul>
            <div >
                <div class="auto-style1">
                    <br />
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style2">
                                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="CART"></asp:Label>
                            </td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="auto-style3"></td>
                                        <td rowspan="5" class="auto-style5">
                                            <asp:GridView ID="grdCart" runat="server" CellPadding="4" DataKeyNames="ProdID,OrderID,SellerID,BuyerID" ForeColor="#333333" GridLines="None" OnRowDeleting="grdCart_RowDeleting" AutoGenerateColumns="False" DataSourceID="CartSource">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" />
                                                    <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" Visible="False" />
                                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" Visible="False" />
                                                    <asp:BoundField DataField="SellerID" HeaderText="SellerID" ReadOnly="True" SortExpression="SellerID" Visible="False" />
                                                    <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
                                                    <asp:BoundField DataField="ProdName" HeaderText="Name" SortExpression="ProdName" />
                                                    <asp:BoundField DataField="ProdPrice" HeaderText="Price" SortExpression="ProdPrice" />
                                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label3" runat="server" ForeColor="White" Text="No Item In Cart"></asp:Label>
                                                </EmptyDataTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </td>
                                        <td class="auto-style2"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">&nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">&nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:ObjectDataSource ID="CartSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOP" TypeName="AtlasOnlineMarket.OrderRelationsTableAdapters.OrderProdTableAdapter" UpdateMethod="Update">
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
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="oid" SessionField="orderToday" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Quantity" Type="Int32" />
                                        <asp:Parameter Name="ProdName" Type="String" />
                                        <asp:Parameter Name="ProdPrice" Type="Decimal" />
                                        <asp:Parameter Name="Original_ProdID" Type="Int32" />
                                        <asp:Parameter Name="Original_OrderID" Type="Int32" />
                                        <asp:Parameter Name="Original_SellerID" Type="Int32" />
                                        <asp:Parameter Name="Original_BuyerID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:ObjectDataSource>
                                            <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Cart Total: "></asp:Label>
                                            <asp:Label ID="lblTot" runat="server" ForeColor="White"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                            <asp:Button ID="btnCheckOut" runat="server" OnClick="btnCheckOut_Click" Text="Check out" Width="113px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
    </form>
</body>
</html>



            
            
