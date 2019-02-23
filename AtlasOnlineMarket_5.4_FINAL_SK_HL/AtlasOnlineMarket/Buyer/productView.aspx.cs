using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.ProductsRelationTableAdapters;
using AtlasOnlineMarket.OrderRelationsTableAdapters;
using System.Web.Security;

namespace AtlasOnlineMarket
{
    using ProdDB = CategoryRelation.ProductsDataTable;
    using OrderDB = OrderRelations.OrdersDataTable;
    using OpDB = OrderRelations.OrderProdDataTable;
    public partial class quantityProductOrder : System.Web.UI.Page
    {
        ProductsTableAdapter adpProd = new ProductsTableAdapter();
        OrdersTableAdapter adpOrd = new OrdersTableAdapter();
        OrderProdTableAdapter adpOP = new OrderProdTableAdapter();
        int prodGet;
        int itemsInCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnAddCart.Enabled = true;
            }
            var queryString = Request.QueryString;
            prodGet = int.Parse(queryString["pID"]);
            var row = adpProd.GetProdByID(prodGet);
            Session["selid"] = row[0].SellerID.ToString();
            Session["pName"] = row[0].ProdName.ToString();
            Session["pPrice"] = row[0].ProdPrice.ToString();
            lbtnCart.Text = "Cart: " + (int)Session["cartToday"] + " item(s)";
            if (!IsPostBack)
            {
                lblName.Text = row[0].ProdName.ToString();
                lblPrice.Text = row[0].ProdPrice.ToString();
                lblQuan.Text = row[0].Quantity.ToString();
                lblDesc.Text = row[0].Description.ToString();
                imgProd.ImageUrl = row[0].ProdImg.ToString();
            }
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            int sID = int.Parse((string)Session["selid"]);
            string pNam = (string)Session["pName"];
            decimal pPr = decimal.Parse((string)Session["pPrice"]);
            int quant = int.Parse(ddlQuant.SelectedValue);
            adpOP.Insert(prodGet, (int)Session["orderToday"], quant, sID, (int)Session["BuyerID"], pNam, pPr, "Undefined", null, null);
            itemsInCart = (int)Session["cartToday"] + 1;
            Session["cartToday"] = itemsInCart;
            lbtnCart.Text = "Cart: " + itemsInCart + " item(s)";
            int lessQuan = int.Parse(lblQuan.Text) - quant;
            int ordToday = (int)Session["orderToday"];
            adpProd.UpdateQuantity(lessQuan, prodGet);
            Session[ordToday.ToString() + "-" + prodGet.ToString() + "-" + sID.ToString()] = quant;
            lblQuan.Text = lessQuan.ToString();
            btnAddCart.Enabled = false;
            lblMsg.Text = "Product added to cart";
        }

        protected void lbtnCart_Click(object sender, EventArgs e)
        {
            int ordID = (int)Session["orderToday"];
            Response.Redirect("~/Buyer/cartPage.aspx?oID=" + ordID);
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