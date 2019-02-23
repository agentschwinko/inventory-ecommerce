using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.CategoryRelationTableAdapters;
using AtlasOnlineMarket.OrderRelationsTableAdapters;

namespace AtlasOnlineMarket
{
    using ProdDB = CategoryRelation.ProductsDataTable;
    using OrderDB = OrderRelations.OrdersDataTable;

    public partial class mainPage1 : System.Web.UI.Page
    {
        ProductsTableAdapter adpProd = new ProductsTableAdapter();
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        ProdDB pdb = new ProdDB();
        OrderDB odb = new OrderDB();
        int buyerid;

        private void GetCID()
        {
            string catGetID = lsbCat.SelectedValue;
            Session["cid"] = catGetID;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCID();
            if(Session["cartToday"] == null)
                Session["cartToday"] = 0;
            if (Session["BuyerID"] == null)
            {
                var queryString = Request.QueryString;
                buyerid = int.Parse(queryString["bID"]);
                Session["BuyerID"] = buyerid;
            }
            if (Session["orderToday"] == null)
            { 
                adpOrd.Insert(2, (int)Session["BuyerID"], null, 0, null, DateTime.Now);
                int oID = (int)adpOrd.GetOID();
                Session["orderToday"] = oID;
            }
            if (Session["cartItems"] == null)
            {
                List<Buyer.Products> cartShop = new List<Buyer.Products>();
                Session["cartItems"] = cartShop;
            }            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string prodID = Server.UrlEncode(btn.CommandArgument);
            Response.Redirect("~/Buyer/productView.aspx?pID=" + prodID);
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