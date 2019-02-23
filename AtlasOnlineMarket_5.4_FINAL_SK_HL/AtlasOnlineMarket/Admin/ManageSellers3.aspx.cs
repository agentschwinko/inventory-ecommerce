using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AtlasOnlineMarket.UsersRelationsTableAdapters;

namespace AtlasOnlineMarket
{
    using UsDB = UsersRelations.SellerDataTable;
    public partial class ManageSellers3 : System.Web.UI.Page
    {
        //string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"].ConnectionString;

        //SqlConnection conn;
        //SqlDataAdapter adapter;
        //SqlCommandBuilder cmdBuilder;
        //DataSet ds;
        //DataTable tblSellers;
        SellerTableAdapter adpSell = new SellerTableAdapter();
        UsDB udb = new UsDB();
        int seller;
        //public ManageSellers3()
        //{
        //    conn = new SqlConnection(cs);
        //    adapter = new SqlDataAdapter("SELECT * FROM Seller", conn);
        //    cmdBuilder = new SqlCommandBuilder(adapter); //adapter is needed ~ can now auto generate insert / update commands etc...
        //    ds = new DataSet();
        //}

        //private void GetDataFromDatabase()
        //{
        //    adapter.Fill(ds, "Sellers"); // fill dataset and call the table students
        //    tblSellers = ds.Tables["Sellers"]; //put that data you fetched into the datatable

        //    tblSellers.PrimaryKey = new DataColumn[] { tblSellers.Columns["SellerID"] };
        //    Cache["tbl"] = tblSellers;

        //    grdSellers.DataSource = tblSellers;
        //    grdSellers.DataBind();


        //}

        private void GetDataFromCache()
        {
            if (Cache["tbl"] != null)
            {

                SellerSource = (ObjectDataSource)Cache["tbl"];

                grdSellers.DataSource = SellerSource;
                grdSellers.DataBind();

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetDataFromDatabase();
        }

        protected void grdSellers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdSellers.EditIndex = -1; // gridview is out of edit mode
            GetDataFromCache(); // repopulate from cache
        }

        protected void grdSellers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {            
            seller = int.Parse(e.Keys["SellerID"].ToString());
            adpSell.Delete(seller);

            GetDataFromCache(); // refresh the gridview
        }

        protected void grdSellers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdSellers.EditIndex = e.NewEditIndex;
            GetDataFromCache();
        }

        protected void grdSellers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            udb = (UsDB)Cache["tbl"]; // retrieve from Cache
            
            seller = int.Parse(e.Keys["SellerID"].ToString());
            string name = e.NewValues["Username"].ToString();
            string pas = e.NewValues["Password"].ToString();
            string fname = e.NewValues["FullName"].ToString();
            string phone = e.NewValues["Phone"].ToString();
            string email = e.NewValues["Email"].ToString();
            decimal grade = decimal.Parse(e.NewValues["Grade"].ToString());
            int role = int.Parse(e.NewValues["RoleID"].ToString());

            adpSell.Update(name, pas, fname, phone, email, grade, role, seller);

            grdSellers.EditIndex = -1;
            GetDataFromCache();
        }

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    tblSellers = (DataTable)Cache["tbl"];

        //    adapter.UpdateCommand = cmdBuilder.GetUpdateCommand();
        //    adapter.DeleteCommand = cmdBuilder.GetDeleteCommand();
        //}
    }
}