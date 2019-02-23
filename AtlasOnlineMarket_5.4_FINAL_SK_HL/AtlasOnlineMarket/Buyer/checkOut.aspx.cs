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
    using OpDB = OrderRelations.OrderProdDataTable;
    using OrdDB = OrderRelations.OrdersDataTable;
    public partial class checkOut : System.Web.UI.Page
    {
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        OrderProdTableAdapter adpOP = new OrderProdTableAdapter();
        OrdDB odb = new OrdDB();
        OpDB opdb = new OpDB();
        int orderGet;
        string delGet;

        private void OnRefresh()
        {
            var queryString = Request.QueryString;
            orderGet = int.Parse(queryString["oID"]);
            odb = adpOrd.GetOrdersByOID(orderGet);
            var row = odb.FindByOrderID(orderGet);
            lblOrd.Text = row.OrderID.ToString();
            lblTotal.Text = "$" + row.Total.ToString();
            lblDate.Text = row.OrderDate.ToString();
            delGet = ddlDelivery.SelectedValue;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                delGet = ddlDelivery.SelectedValue;
                var queryString = Request.QueryString;
                orderGet = int.Parse(queryString["oID"]);
                odb = adpOrd.GetOrdersByOID(orderGet);
                var row = odb.FindByOrderID(orderGet);
                lblOrd.Text = row.OrderID.ToString();
                lblTotal.Text = "$" + row.Total.ToString();
                lblDate.Text = row.OrderDate.ToString();
                lblDelMe.Text = delGet;
            }
            else
            {
                OnRefresh();
                lblDel.Text = "Delivery Method: ";
                lblDelMe.Text = delGet;
            }
        }

        protected void btnConf_Click(object sender, EventArgs e)
        {
            adpOrd.UpdateDelivery(delGet, orderGet);
            opdb = adpOP.GetOP(orderGet);
            int sid;
            int quant;
            decimal price;
            int buyID;
            int prodID;
            foreach (var row in opdb)
            {
                sid = row.SellerID;
                quant = row.Quantity;
                price = row.ProdPrice;
                buyID = row.BuyerID;
                prodID = row.ProdID;

                decimal total = (decimal)adpOP.ScalarGetPriceBySeller(sid, orderGet, prodID, buyID);
                adpOP.UpdatePriceStat("Pending", total, prodID, orderGet, sid, buyID);
            }
            decimal oTotal = (decimal)adpOP.ScalarTotalByOrder(orderGet);
            foreach (var row in opdb)
            {
                sid = row.SellerID;
                quant = row.Quantity;
                price = row.ProdPrice;
                buyID = row.BuyerID;
                prodID = row.ProdID;
                adpOP.UpdatePriceStt(oTotal, prodID, orderGet, sid, buyID);
            }


            lblMsg.Text = "Order Confirmed";
            Response.Redirect("~/Buyer/thankYou.aspx");
        }

        protected void ddlDelivery_SelectedIndexChanged(object sender, EventArgs e)
        {
            delGet = ddlDelivery.SelectedValue;
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