using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.OrderRelationsTableAdapters;
using AtlasOnlineMarket.ProductsRelationTableAdapters;

namespace AtlasOnlineMarket.Buyer
{
    using OpDB = OrderRelations.OrderProdDataTable;
    using OrdDB = OrderRelations.OrdersDataTable;
    using OrPrQu = OrderRelations.OrderProdQuanDataTable;
    public partial class cartPage : System.Web.UI.Page
    {
        OrderProdTableAdapter adpOP = new OrderProdTableAdapter();
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        ProductsTableAdapter adpProd = new ProductsTableAdapter();
        OrderProdQuanTableAdapter adpQ = new OrderProdQuanTableAdapter();
        OrPrQu opq = new OrPrQu();
        OpDB opdb = new OpDB();
        OrdDB odb = new OrdDB(); 
        decimal tot = 0;
        int orderGet;
                
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {                  
                btnCheckOut.Enabled = true;
                var queryString = Request.QueryString;
                orderGet = int.Parse(queryString["oID"]);
                Session["OrderID"] = orderGet;
                
                Cache["tbl"] = CartSource;
                tot = (decimal)adpOP.ScalarGetSum(orderGet);
                adpOrd.UpdateNewOrder(tot, "Pending", orderGet);
                lblTot.Text = "$" + tot;
            }            
        }

        protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CartSource = (ObjectDataSource)Cache["tbl"];
            int pID = int.Parse(e.Keys["ProdID"].ToString());
            int oID = int.Parse(e.Keys["OrderID"].ToString());
            int sID = int.Parse(e.Keys["SellerID"].ToString());
            int pquant = (int)adpProd.ScalarQuanity(pID);
            int quant = (int)Session[oID.ToString() + "-" + pID.ToString() + "-" + sID.ToString()];

            int moreQuan = pquant + quant;
            adpProd.UpdateQuantity(moreQuan, pID);
            adpOP.Delete(pID, oID, sID, (int)Session["BuyerID"]);
            //GetDataFromCache();            
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            adpOrd.UpdateNewOrder(tot, "Pending", orderGet);
            Response.Redirect("~/Buyer/checkOut.aspx?oID=" + (int)Session["OrderID"]);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
           // Response.Redirect("~/Buyer/mainPage.aspx?bID=" + (int)Session["BuyerID"]);
        }

        protected void grdCart_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            GridViewRowCollection rows = grdCart.Rows;
            if (rows.Count > 1)
            {
                orderGet = (int)Session["OrderID"];
                tot = (decimal)adpOP.ScalarGetSum(orderGet);
                lblTot.Text = "$" + tot;
            }
            else
            {
                tot = 0;
                lblTot.Text = "$" + 0;
                btnCheckOut.Enabled = false;
                Session["cartToday"] = null;
            }
        }
    }
}