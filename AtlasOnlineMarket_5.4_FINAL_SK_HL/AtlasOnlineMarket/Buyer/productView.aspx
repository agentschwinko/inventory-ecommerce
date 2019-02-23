<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productView.aspx.cs" Inherits="AtlasOnlineMarket.quantityProductOrder" %>

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
    

    <form id="form1" runat="server">
        <div >
        <ul>                
                <li><a href="mainPage.aspx">Main Page</a></li>
                <li><a href="orderMan.aspx">Order History</a></li>
            <li><asp:LinkButton ID="lbtnSignOut" runat="server" ForeColor="White" OnClick="lbtnSignOut_Click">Sign Out</asp:LinkButton>
                </li>
            </ul>
        <div class="a" style="height: 551px">
            <br />
        <br />
            <table class="auto-style5">
                <tr>
                    <td class="auto-style7">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:LinkButton ID="lbtnCart" runat="server" ForeColor="White" OnClick="lbtnCart_Click">Cart: </asp:LinkButton>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblName" runat="server" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DetailsView ID="dvSeller" runat="server" AutoGenerateRows="False" DataKeyNames="SellerID" DataSourceID="SellerSource" ForeColor="White" Height="50px" Width="125px">
                            <Fields>
                                <asp:BoundField DataField="SellerID" HeaderText="SellerID" InsertVisible="False" ReadOnly="True" SortExpression="SellerID" />
                                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                    <td colspan="2">
                        <asp:Image ID="imgProd" runat="server" Height="150px" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Price"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblPrice" runat="server" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:ObjectDataSource ID="SellerSource" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSellerByID" TypeName="AtlasOnlineMarket.ProductsRelationTableAdapters.SellerShowTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_SellerID" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="seller" SessionField="selid" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Grade" Type="Decimal" />
                                <asp:Parameter Name="Original_SellerID" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Items Left"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblQuan" runat="server" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Desciption"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblDesc" runat="server" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style10">
                        <asp:Label ID="Label5" runat="server" ForeColor="White" Text="Quantity"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddlQuant" runat="server" AutoPostBack="True" Width="95px">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">
                        &nbsp;</td>
                    <td class="auto-style10">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnAddCart" runat="server" OnClick="btnAddCart_Click" Text="Add To Cart" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        <br />
        <br />
        <br />
        <br />
            
        </div>


</div>
    </form>
        
</body>
</html>
