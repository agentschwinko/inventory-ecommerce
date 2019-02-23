using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.OrderRelationsTableAdapters;

namespace AtlasOnlineMarket
{
    using OrdDB = OrderRelations.OrdersDataTable;
    public partial class manageOrders : System.Web.UI.Page
    {
        int userID;
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        OrdDB ordb = new OrdDB();
        int oid;
        private void GetDataFromCachePending()
        {
            if (Cache["tbl"] != null)
            {
                PendingSource = (ObjectDataSource)Cache["tbl"];

                grdPending.DataSource = PendingSource;
                grdPending.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Seller/manageProduct.aspx?sID=" + (int)Session["uid"]);
        }

        protected void grdPending_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = grdPending.SelectedRow;
            int orID = int.Parse(row.Cells[1].Text);
            Response.Redirect("~/Seller/orderView.aspx?oID=" + orID);
        }
    }
}