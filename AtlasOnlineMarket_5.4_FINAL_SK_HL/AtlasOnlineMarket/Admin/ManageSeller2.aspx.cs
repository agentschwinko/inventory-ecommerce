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
    public partial class ManageSeller2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"].ConnectionString;

        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommandBuilder cmdBuilder;
        DataSet ds;
        DataTable tblSellers;

        public ManageSeller2()
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

        }
    }
}