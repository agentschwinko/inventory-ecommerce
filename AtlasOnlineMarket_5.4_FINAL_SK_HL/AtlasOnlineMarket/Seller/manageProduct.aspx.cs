using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.ProductsRelationTableAdapters;
using System.IO;
using System.Web.Security;

namespace AtlasOnlineMarket
{
    using ProdDB = ProductsRelation.ProductsDataTable;
    public partial class manageProduct : System.Web.UI.Page
    {
        ProductsTableAdapter adpProd = new ProductsTableAdapter();
        SellerTableAdapter adpSell = new SellerTableAdapter();
        ProdDB pdb = new ProdDB();
        int prodID;
        int userID;

        private void GetUID()
        {
            //var queryString = Request.QueryString;
            //userID = int.Parse(queryString["sID"]);
            // Session["uid"] = userID;
            userID = (int)Session["uid"];
        }
        private void RefreshGridView()
        {
            Cache["tbl"] = ProdDataSource;

            grdProd.DataSource = ProdDataSource;
            grdProd.DataBind();
        }
        private void GetDataFromCache()
        {
            if (Cache["tbl"] != null)
            {
                ProdDataSource = (ObjectDataSource)Cache["tbl"];

                grdProd.DataSource = ProdDataSource;
                grdProd.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUID();
            Session["cStt"] = "Completed";
            Session["uStt"] = "Undefined";
        }

        protected void grdProd_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdProd.EditIndex = e.NewEditIndex;
        }

        protected void grdProd_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string name = e.NewValues["ProdName"].ToString();
            decimal price = decimal.Parse(e.NewValues["ProdPrice"].ToString());
            int quan = int.Parse(e.NewValues["Quantity"].ToString());
            string des = e.NewValues["Description"].ToString();
            int cat = int.Parse(e.NewValues["CategoryID"].ToString());
            int prod = int.Parse(e.Keys["ProdID"].ToString());

            adpProd.UpdateProd(name, quan, price, des, cat, prod);

            grdProd.EditIndex = -1;
            GetDataFromCache();
        }

        protected void grdProd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdProd.EditIndex = -1;
            GetDataFromCache();
        }

        protected void grdProd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            prodID = int.Parse(e.Keys["ProdID"].ToString());
            adpProd.Delete(prodID);

            GetDataFromCache();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var queryString = Request.QueryString;
            userID = int.Parse(queryString["sID"]);
            Response.Redirect("~/Seller/manageOrder.aspx?sID=" + userID);
        }

        protected void lbtnSO_Click(object sender, EventArgs e)
        {
            Session["uid"] = null;
            Session["pStt"] = null;
            Session["prStt"] = null;
            Session["cStt"] = null;

            FormsAuthentication.SignOut();
            Response.Redirect("~/landingPage.aspx");
        }
    }
}