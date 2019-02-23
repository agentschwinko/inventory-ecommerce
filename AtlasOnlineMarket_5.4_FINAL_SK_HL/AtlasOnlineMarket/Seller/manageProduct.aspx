<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageProduct.aspx.cs" Inherits="AtlasOnlineMarket.manageProduct" %>

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

        .auto-style5 {
            height: 82px;
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

                <li><a class="active" href="#manageProduct">Manage Product</a></li>
                <li><a href="newProduct.aspx">Add New Product</a></li>
                <li><a href="newCategory.aspx">Add New Category</a></li>
                <li><a href="manageOrders.aspx">Manage Orders</a></li>
                <li><a href="../landingPage.aspx">Logout</a></li>
            </ul>


            <br />
            <br />
            <br />
            <div class="a">
                <h1 style="color: white;">Manage Products</h1>
            </div>
            <table style="width: 100%;">                
                <tr>
                    <td style="height: 500px;" class="auto-style4">
                        <asp:GridView ID="grdProd" runat="server" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="ProdDataSource" Height="134px" OnRowEditing="grdProd_RowEditing" Width="1137px" AllowPaging="True" CellPadding="1" ForeColor="#333333" GridLines="None" PageSize="3">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:TemplateField HeaderText="Category">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("CategoryID", "{0}") %>' DataSourceID="CatSource" DataTextField="Name" DataValueField="CategoryID">
                                            <asp:ListItem Value="1">Laptop</asp:ListItem>
                                            <asp:ListItem Value="2">Laptop Bags</asp:ListItem>
                                            <asp:ListItem Value="3">Tablet</asp:ListItem>
                                            <asp:ListItem Value="4">Tablet Accessories</asp:ListItem>
                                            <asp:ListItem Value="5">Smartwatches</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ImageField DataImageUrlField="ProdImg" HeaderText="Image" ReadOnly="True">
                                </asp:ImageField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
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
                        <asp:ObjectDataSource ID="ProdDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProd" TypeName="AtlasOnlineMarket.ProductsRelationTableAdapters.ProductsTableAdapter" UpdateMethod="UpdateProd">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_ProdID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ProdName" Type="String" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="ProdPrice" Type="Decimal" />
                                <asp:Parameter Name="ProdImg" Type="String" />
                                <asp:Parameter Name="SellerID" Type="Int32" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="seller" SessionField="uid" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ProdName" Type="String" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="ProdPrice" Type="Decimal" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="Int32" />
                                <asp:Parameter Name="Original_ProdID" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"><br />
                        <asp:ObjectDataSource ID="CatSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategory" TypeName="AtlasOnlineMarket.CategoryRelationTableAdapters.CategoryTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_CategoryID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Original_CategoryID" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>
