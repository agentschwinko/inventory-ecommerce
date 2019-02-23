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
    public partial class registration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"]
           .ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (chkSeller.Checked)
            {
                string username = txtUsername.Text;
                //string password = txtPassword.Text;
                string password = Encryptor.EncryptText(txtPassword.Text.Trim());
                string fullName = txtFullName.Text;
                string phone = txtPhone.Text;
                string email = txtEmail.Text;
                int roleId = 2;

                if (CheckUsername(username))
                {
                    lblMessage.Text = "This username is already taken. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    string query = "INSERT INTO seller(username, password, fullname, phone, email, roleid) " +
                        "VALUES ('" + username + "', '" + password + "', '" + fullName + "', '" + phone + "', '" + email + "' ,'" + roleId + "')";

                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();

                        int rowsInserted = cmd.ExecuteNonQuery();

                        if (rowsInserted == 1)
                        {
                            lblMessage.Text = "New Seller Has Been Added";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "New Seller Has NOT Been Added";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }

                        txtUsername.Text = "";
                        txtPassword.Text = "";
                        txtPasswordConfirm.Text = "";
                        txtFullName.Text = "";
                        txtPhone.Text = "";
                        txtEmail.Text = "";
                    }
                }
            }
            else
            {

                string username = txtUsername.Text;
                string password = Encryptor.EncryptText(txtPassword.Text.Trim());
                string fullName = txtFullName.Text;
                string phone = txtPhone.Text;
                string email = txtEmail.Text;
                int roleId = 3;

                if (CheckUsername(username))
                {
                    lblMessage.Text = "This username is already taken. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {

                    string query = "INSERT INTO buyer(username, password, fullname, phone, email, roleid) " +
                        "VALUES ('" + username + "', '" + password + "', '" + fullName + "', '" + phone + "', '" + email + "' ,'" + roleId + "')";

                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();

                        int rowsInserted = cmd.ExecuteNonQuery();

                        if (rowsInserted == 1)
                        {
                            lblMessage.Text = "New User Has Been Added";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "New User Has NOT Been Added";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }

                        txtUsername.Text = "";
                        txtPassword.Text = "";
                        txtPasswordConfirm.Text = "";
                        txtFullName.Text = "";
                        txtPhone.Text = "";
                        txtEmail.Text = "";
                    }
                }

            }
        }

        private bool CheckUsername(string username)
        {
            string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"]
           .ConnectionString;

            if (chkSeller.Checked)

            {

                string cmdText = "SELECT COUNT(*) FROM seller WHERE Username = @username";

                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open(); // Open DB connection.

                    using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username); // Add the SQL parameter.

                        int count = (int)cmd.ExecuteScalar();

                        // True (> 0) when the username exists, false (= 0) when the username does not exist.
                        return (count > 0);
                    }
                }
            }
            else
            {
                string cmdText = "SELECT COUNT(*) FROM buyer WHERE Username = @username";

                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open(); // Open DB connection.

                    using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username); // Add the SQL parameter.

                        int count = (int)cmd.ExecuteScalar();

                        // True (> 0) when the username exists, false (= 0) when the username does not exist.
                        return (count > 0);
                    }
                }
            }
        }
    }
}