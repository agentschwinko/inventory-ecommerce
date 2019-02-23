using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.OrderRelationsTableAdapters;

namespace AtlasOnlineMarket.Seller
{
    using OrDB = OrderRelations.OrdersDataTable;
    using OpDB = OrderRelations.OrderProdDataTable;
    using SttDB = OrderRelations.StatusDataTable;
    public partial class orderView : System.Web.UI.Page
    {
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        OrderProdTableAdapter adpOP = new OrderProdTableAdapter();
        StatusTableAdapter adpStt = new StatusTableAdapter();
        OrDB ordb = new OrDB();
        OpDB opdb = new OpDB();
        SttDB stdb = new SttDB();
        int orderGet;

        protected void Page_Load(object sender, EventArgs e)
        {
            var queryString = Request.QueryString;
            orderGet = int.Parse(queryString["oID"]);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string stt = e.NewValues["Status"].ToString();
            int buyID = int.Parse((string)e.Keys["BuyerID"].ToString());
            int pID = int.Parse((string)e.Keys["ProdID"].ToString());

            adpOP.UpdateStatusOnOrder(stt, pID, orderGet, (int)Session["uid"], buyID);
            
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            stdb = adpStt.CheckStatus(orderGet);
            List<string> statusRows = new List<string>();
            foreach (var row in stdb)
            {
                string sttS = row["Status"].ToString();
                statusRows.Add(sttS);
            }
            foreach (var i in statusRows)
            {
                if (!i.Equals("Completed"))
                    adpOrd.UpdateStatus("Processing", orderGet);
                else
                    adpOrd.UpdateStatus("Completed", orderGet);
            }
        }
    }
}