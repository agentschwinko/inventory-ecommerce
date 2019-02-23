using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.OrderRelationsTableAdapters;

namespace AtlasOnlineMarket.Buyer
{
    public partial class thankYou : System.Web.UI.Page
    {
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["cartToday"] = null;
            Session["cartItems"] = 0;
            Session["orderToday"] = null;

        }
        protected void lbtnSignOut_Click(object sender, EventArgs e)
        {            
            Session["BuyerID"] = null;                        
            Session["selid"] = null;
            Session["pName"] = null;
            Session["pPrice"] = null;
            Session["cartItems"] = null;


            FormsAuthentication.SignOut();
            Response.Redirect("~/landingPage.aspx");
        }
    }
}