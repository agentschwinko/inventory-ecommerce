<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSellers3.aspx.cs" Inherits="AtlasOnlineMarket.ManageSellers3" %>

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
            width: 180px;
        }
    </style>
</head>
<body>
    <div class="bg">
    <form id="form1" runat="server">
        <div class="a">
        <br />
        <br />
        <br />
        <h1 style="color:white;">Manage Sellers</h1>
        <br />
            
            
&nbsp;<table style="width:100%;">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
            <asp:GridView ID="grdSellers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="SellerID" OnRowCancelingEdit="grdSellers_RowCancelingEdit" OnRowDeleting="grdSellers_RowDeleting" OnRowEditing="grdSellers_RowEditing" OnRowUpdating="grdSellers_RowUpdating" AllowPaging="True" DataSourceID="SellerSource">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SellerID" HeaderText="SellerID" ReadOnly="True" InsertVisible="False" SortExpression="SellerID" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                    <asp:BoundField DataField="RoleID" HeaderText="RoleID" SortExpression="RoleID" />
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
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:ObjectDataSource ID="SellerSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSellers" TypeName="AtlasOnlineMarket.UsersRelationsTableAdapters.SellerTableAdapter" UpdateMethod="UpdateSeller">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_SellerID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="FullName" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Grade" Type="Decimal" />
                                <asp:Parameter Name="RoleID" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="FullName" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Grade" Type="Decimal" />
                                <asp:Parameter Name="RoleID" Type="Int32" />
                                <asp:Parameter Name="Original_SellerID" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" />
            <br />
            
            
        </div>



    </form>
        </div>
</body>
</html>
