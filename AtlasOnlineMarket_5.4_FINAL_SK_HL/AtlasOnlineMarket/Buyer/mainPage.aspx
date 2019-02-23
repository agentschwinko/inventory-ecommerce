<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainPage.aspx.cs" Inherits="AtlasOnlineMarket.mainPage1" %>

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
<body class="bg">
    <form id="form1" runat="server" class="auto-style1">
        <div >
        <ul>

                <li><a class="active" href="#mainPage">Main Page</a></li>
                <li><a href="orderMan.aspx">Order History</a></li>
                <li><asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="lbtnSignOut_Click">Sign Out</asp:LinkButton>
                </li>
            </ul>
        <table style="width:100%;">
            <tr>
                <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:ListBox ID="lsbCat" runat="server" AutoPostBack="True" DataSourceID="CategoryName" DataTextField="Name" DataValueField="CategoryID" Height="258px" Width="200px"></asp:ListBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>
                    <br />
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProdID" DataSourceID="CatBasedSource" GroupItemCount="3">
                        <AlternatingItemTemplate>
                            <td runat="server" style="background-color: #FFFFFF; color: #284775;">
                                <asp:Image ID="Image1" runat="server" Height="205px" ImageUrl='<%# Eval("ProdImg") %>' Width="173px" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="                                                                                     "></asp:Label>
                                <br />
                                Name:
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ProdID", "{0}") %>' OnClick="LinkButton1_Click" Text='<%# Eval("ProdName") %>'></asp:LinkButton>
                                <br />
                                Price:
                                <asp:Label ID="ProdPriceLabel" runat="server" Text='<%# Eval("ProdPrice") %>' />
                                <br />
                                Quantity:
                                <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                <br /></td>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="background-color: #999999;">ProdName:
                                <asp:TextBox ID="ProdNameTextBox" runat="server" Text='<%# Bind("ProdName") %>' />
                                <br />ProdPrice:
                                <asp:TextBox ID="ProdPriceTextBox" runat="server" Text='<%# Bind("ProdPrice") %>' />
                                <br />Quantity:
                                <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                                <br />ProdImg:
                                <asp:TextBox ID="ProdImgTextBox" runat="server" Text='<%# Bind("ProdImg") %>' />
                                <br />SellerID:
                                <asp:TextBox ID="SellerIDTextBox" runat="server" Text='<%# Bind("SellerID") %>' />
                                <br />Description:
                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                <br />CategoryID:
                                <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                                <br />ProdID:
                                <asp:Label ID="ProdIDLabel1" runat="server" Text='<%# Eval("ProdID") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                <br /></td>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
<td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">ProdName:
                                <asp:TextBox ID="ProdNameTextBox0" runat="server" Text='<%# Bind("ProdName") %>' />
                                <br />ProdPrice:
                                <asp:TextBox ID="ProdPriceTextBox0" runat="server" Text='<%# Bind("ProdPrice") %>' />
                                <br />Quantity:
                                <asp:TextBox ID="QuantityTextBox0" runat="server" Text='<%# Bind("Quantity") %>' />
                                <br />ProdImg:
                                <asp:TextBox ID="ProdImgTextBox0" runat="server" Text='<%# Bind("ProdImg") %>' />
                                <br />SellerID:
                                <asp:TextBox ID="SellerIDTextBox0" runat="server" Text='<%# Bind("SellerID") %>' />
                                <br />Description:
                                <asp:TextBox ID="DescriptionTextBox0" runat="server" Text='<%# Bind("Description") %>' />
                                <br />CategoryID:
                                <asp:TextBox ID="CategoryIDTextBox0" runat="server" Text='<%# Bind("CategoryID") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Clear" />
                                <br /></td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="background-color: #E0FFFF; color: #333333;">&nbsp;<asp:Image ID="Image2" runat="server" Height="205px" ImageUrl='<%# Eval("ProdImg") %>' Width="173px" />
                                <br />
                                &nbsp;<br />
                                Name:
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("ProdID", "{0}") %>' OnClick="LinkButton1_Click" Text='<%# Eval("ProdName") %>'></asp:LinkButton>
                                <br />
                                Price:
                                <asp:Label ID="ProdPriceLabel0" runat="server" Text='<%# Eval("ProdPrice") %>' />
                                <br />
                                Quantity:<asp:Label ID="QuantityLabel0" runat="server" Text='<%# Eval("Quantity") %>' />
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">ProdName:
                                <asp:Label ID="ProdNameLabel" runat="server" Text='<%# Eval("ProdName") %>' />
                                <br />ProdPrice:
                                <asp:Label ID="ProdPriceLabel1" runat="server" Text='<%# Eval("ProdPrice") %>' />
                                <br />Quantity:
                                <asp:Label ID="QuantityLabel1" runat="server" Text='<%# Eval("Quantity") %>' />
                                <br />ProdImg:
                                <asp:Label ID="ProdImgLabel" runat="server" Text='<%# Eval("ProdImg") %>' />
                                <br />SellerID:
                                <asp:Label ID="SellerIDLabel" runat="server" Text='<%# Eval("SellerID") %>' />
                                <br />Description:
                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                <br />CategoryID:
                                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                <br />ProdID:
                                <asp:Label ID="ProdIDLabel" runat="server" Text='<%# Eval("ProdID") %>' />
                                <br /></td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="CategoryName" runat="server" ConnectionString="<%$ ConnectionStrings:AtlasConnectionString %>" SelectCommand="SELECT [CategoryID], [Name] FROM [Category]"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="CatBasedSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProduct" TypeName="AtlasOnlineMarket.CategoryRelationTableAdapters.ProductsTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ProdID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="ProdImg" Type="String" />
                <asp:Parameter Name="SellerID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="category" SessionField="cid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="ProdImg" Type="String" />
                <asp:Parameter Name="SellerID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="Original_ProdID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
            </div>
    </form>
        
</body>
</html>
