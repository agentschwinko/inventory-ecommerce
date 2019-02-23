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
    public partial class WebForm1 : System.Web.UI.Page
    {
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lbtnSignOut_Click(object sender, EventArgs e)
        {
            adpOrd.DeleteNullOrder((int)Session["orderToday"]);
            Session["cartToday"] = null;
            Session["BuyerID"] = null;
            Session["orderToday"] = null;
            Session["cartItems"] = null;
            Session["selid"] = null;
            Session["pName"] = null;
            Session["pPrice"] = null;


            FormsAuthentication.SignOut();
            Response.Redirect("~/landingPage.aspx");
        }
    }
}