using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.UsersRelationsTableAdapters;

namespace AtlasOnlineMarket
{
    using UsDB = UsersRelations.BuyerDataTable;
    public partial class login : System.Web.UI.Page
    {
        BuyerTableAdapter adpBuy = new BuyerTableAdapter();
        SellerTableAdapter adpSell = new SellerTableAdapter();
        AdminTableAdapter adpAdmin = new AdminTableAdapter();
        UsDB udb = new UsDB();
        string uname;
        string pwd;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["cStt"] = "Completed";
            Session["uStt"] = "Undefined";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            uname = txtUsername.Text;
            //pwd = txtPassword.Text;
            pwd = Encryptor.EncryptText(txtPassword.Text.Trim());
            var row = adpBuy.GetUser(uname, pwd);
            var row2 = adpSell.CheckSeller(uname, pwd);
            var row3 = adpAdmin.CheckAdmin(uname, pwd);
            if(row.Count > 0)
            {
                Response.Redirect("~/Buyer/mainPage.aspx?bID=" + (int)adpBuy.ScalarBID(uname, pwd));
            }
            else if(row2.Count > 0)
            {
                //Re-route to SellerLandingPage
              // Response.Redirect("~/Seller/manageProduct.aspx?sID=" + (int)adpSell.ScalarSellerID(uname,pwd));
                Response.Redirect("AdminMainPage.aspx?sID=" + (int)adpSell.ScalarSellerID(uname, pwd));
            }
            else
            {
                lblMsg.Text = "Incorrect username or password.";
            }
        }
    }
}