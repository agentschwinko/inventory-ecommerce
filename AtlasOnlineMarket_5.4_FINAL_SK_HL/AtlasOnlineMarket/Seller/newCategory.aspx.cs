using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtlasOnlineMarket
{
    public partial class newCategory : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"]
            .ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            string categoryName = txtCategoryName.Text;

            string query = "INSERT INTO category(name) VALUES ('" + categoryName + "')";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                int rowsInserted = cmd.ExecuteNonQuery();

                if (rowsInserted == 1)
                {
                    lblMessage.Text = "New Category Has Been Added!";
                }
                else
                {
                    lblMessage.Text = "New Category Has NOT Been Added!";
                }

                txtCategoryName.Text = " ";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtCategoryName.Text = "";
        }
    }
}