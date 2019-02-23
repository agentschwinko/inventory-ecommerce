using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtlasOnlineMarket
{
    public partial class ManageSeller : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"].ConnectionString;

        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommandBuilder cmdBuilder;
        DataSet ds;
        DataTable tblSellers;

        public ManageSeller()
        {
            conn = new SqlConnection(cs);
            adapter = new SqlDataAdapter("SELECT * FROM Seller", conn);
            cmdBuilder = new SqlCommandBuilder(adapter); //adapter is needed ~ can now auto generate insert / update commands etc...
            ds = new DataSet();
        }

        private void GetDataFromDatabase()
        {
            adapter.Fill(ds, "Sellers"); // fill dataset and call the table students
            tblSellers = ds.Tables["Sellers"]; //put that data you fetched into the datatable

            tblSellers.PrimaryKey = new DataColumn[] { tblSellers.Columns["SellerID"] };
            Cache["tbl"] = tblSellers;

            grdSellers.DataSource = tblSellers;
            grdSellers.DataBind();


        }

        private void GetDataFromCache()
        {
            if (Cache["tbl"] != null)
            {

                tblSellers = (DataTable)Cache["tbl"];

                grdSellers.DataSource = tblSellers;
                grdSellers.DataBind();

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDataFromDatabase();
        }

        protected void grdSellers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdSellers.EditIndex = -1; // gridview is out of edit mode
            GetDataFromCache(); // repopulate from cache
        }

        protected void grdSellers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            tblSellers = (DataTable)Cache["tbl"]; // retrieve from Cache
            var row = tblSellers.Rows.Find(e.Keys["SellerID"]); // gives what row is being edited

            row.Delete();

            GetDataFromCache(); // refresh the gridview

        }

        protected void grdSellers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdSellers.EditIndex = e.NewEditIndex;
            GetDataFromCache();
        }

        protected void grdSellers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            tblSellers = (DataTable)Cache["tbl"]; // retrieve from Cache

            var row = tblSellers.Rows.Find(e.Keys["SellerID"]); // gives what row is being edited

            row["Username"] = e.NewValues["Username"];
            row["FullName"] = e.NewValues["FullName"];
            row["Phone"] = e.NewValues["Phone"];
            row["Email"] = e.NewValues["Email"];
            row["Grade"] = e.NewValues["Grade"];

            grdSellers.EditIndex = -1;
            GetDataFromCache();
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            tblSellers = (DataTable)Cache["tbl"];

            adapter.UpdateCommand = cmdBuilder.GetUpdateCommand();
            adapter.DeleteCommand = cmdBuilder.GetDeleteCommand();
        }
    }
}