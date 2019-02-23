<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="AtlasOnlineMarket.registration" %>

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
<body>
    <div class="bg">
        <form id="form1" runat="server">
            <ul>
                <li><a class="active" href="landingPage.aspx">HOME</a></li>
                <li><a href="login.aspx">Login</a></li>
            </ul>
            <div class="a">
                <br />
                <br />
                <br />
                <h1 style="color: white;">Registration</h1>
                <br />
                <br />
                <br />
                <asp:Label ID="lblUsername" runat="server" ForeColor="White" Text="Username: "></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="*Unique Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblPassword" runat="server" ForeColor="White" Text="Password: "></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Password Confirm: "></asp:Label>
                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="*Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidatorConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="*Passwords Do Not Match" ForeColor="Red"></asp:CompareValidator>
                <br />
                <br />
                <asp:Label ID="lblFullName" runat="server" ForeColor="White" Text="Full Name:"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFullName" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="*Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblPhone" runat="server" ForeColor="White" Text="Phone: "></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="*Enter a valid phone number" ForeColor="Red" ValidationExpression="^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="*Phone Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Email: "></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*Email format incorrect" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CheckBox ID="chkSeller" runat="server" ForeColor="White" Text="Seller?" />
                <br />
                <br />
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
                <br />
                <br />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
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
                <br />
                <br />
                <br />
                <br />

            </div>



        </form>
    </div>
</body>
</html>

