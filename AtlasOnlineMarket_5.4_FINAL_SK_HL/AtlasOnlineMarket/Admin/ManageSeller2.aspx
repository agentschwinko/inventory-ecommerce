<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSeller2.aspx.cs" Inherits="ManageSeller2" %>

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
</style>
</head>
<body>
    <div class="bg">
    <form id="form1" runat="server">
        <div class="a">
        <br />
        <br />
        <br />
        <h1 style="color:white;">Product</h1>
        <br />
            
            
            <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Products In Category: "></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="White" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <asp:GridView ID="grdSellers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="SellerID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SellerID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" />
                    <asp:BoundField DataField="FullName" HeaderText="Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" />
                    <asp:BoundField DataField="RoleID" HeaderText="Role ID" ReadOnly="True" />
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
            <br />
            
            
        </div>



    </form>
        </div>
</body>
</html>
