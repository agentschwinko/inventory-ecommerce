using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtlasOnlineMarket
{
    public partial class newProduct : System.Web.UI.Page
    {        
        string cs = ConfigurationManager.ConnectionStrings["AtlasConnectionString"]
            .ConnectionString;
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = (int)Session["uid"];
            txtSeller.Text = userID.ToString();
            if (!IsPostBack)
            {
                string query = "SELECT name, categoryid FROM category";

                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlCategory.DataSource = reader;
                    ddlCategory.DataTextField = "Name"; // required with dropdownlist
                    ddlCategory.DataValueField = "CategoryID"; // this as well...
                    ddlCategory.DataBind();

                }
                Session["uid"] = userID;
                ddlCategory.Items.Insert(0, new ListItem("Select a Category", "-1"));

            }
        }

        protected void btnAddNewCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("newCategory.aspx");
        }

 
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            string prodName = txtName.Text;
            double price = Double.Parse(txtPrice.Text);
            int quantity = Int32.Parse(txtQuantity.Text);
            string[] imagesExt = { "png", "jpg", "jpeg" };
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            string imgLink = "~/Uploads/" + Path.GetFileName(FileUpload1.FileName);
            bool isValidFile = false;
            for (int i = 0; i < imagesExt.Length; i++)
            {
                if (ext == "." + imagesExt[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid File. Please upload a File with extension " + string.Join(", ", imagesExt);
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "File uploaded successfully.";

                FileUpload1.SaveAs(Server.MapPath("~/Uploads/") + Path.GetFileName(FileUpload1.FileName));

                int sellerId = Int32.Parse(txtSeller.Text);
                string description = txtDescription.Text;

                string query = "INSERT INTO products(prodName, prodprice, quantity, prodimg, sellerid, description, categoryid) " +
                    "VALUES ('" + prodName + "', '" + price + "', '" + quantity + "', '" + imgLink + "', '" + sellerId + "' ,'" + description + "','" + ddlCategory.SelectedValue + "' )";

                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    int rowsInserted = cmd.ExecuteNonQuery();

                    if (rowsInserted == 1)
                    {
                        lblMessage2.Text = "New Product Has Been Added";
                        lblMessage.ForeColor = Color.White;
                        lblMessage2.ForeColor = Color.White;
                        txtName.Text = " ";
                        txtPrice.Text = " ";
                        txtQuantity.Text = " ";
                        txtDescription.Text = " ";
                        txtSeller.Text = " ";
                        ddlCategory.SelectedIndex = -1;
                    }
                    else
                    {
                        lblMessage2.Text = "New Product Has NOT Been Added";
                        lblMessage.ForeColor = Color.Yellow;
                        lblMessage2.ForeColor = Color.Yellow;
                        txtName.Text = " ";
                        txtPrice.Text = " ";
                        txtQuantity.Text = " ";
                        txtDescription.Text = " ";
                        txtSeller.Text = " ";
                        ddlCategory.SelectedIndex = -1;
                    }                   

                    //if a file is selected
                    //if (FileUpload1.HasFile)
                    //{
                    //    string fileName = FileUpload1.FileName;
                    //    string fileExtenstion = Path.GetExtension(fileName);

                    //    check for the file extenstion
                    //        if (fileExtenstion.ToLower() == ".png")
                    //        {
                    //            // get file size, in bytes
                    //            int fileSize = FileUpload1.PostedFile.ContentLength;

                    //            // if file size less than or equal to 2MB
                    //            if (fileSize <= 2097152)
                    //            {
                    //                // save file in Uploads folder
                    //                FileUpload1.SaveAs(Server.MapPath("~/Uploads/") + fileName);
                    //                lblMessage.Text = "File successfully uploaded";
                    //                lblMessage.ForeColor = Color.Green;
                    //            }
                    //            else
                    //            {
                    //                lblMessage.Text = "File size exceeds the limit of 2MB";
                    //                lblMessage.ForeColor = Color.Red;
                    //            }
                    //        }
                    //        else
                    //        {
                    //            lblMessage.Text = "Only PNG files are allowed";
                    //            lblMessage.ForeColor = Color.Red;
                    //        }
                    //}
                    //else
                    //{
                    //    lblMessage.Text = "Please select a file";
                    //    lblMessage.ForeColor = Color.Red;
                    //}
                }
            }
            //string prodImg = "~/Uploads/" + prodName + ".png";
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ddlCategory.SelectedIndex = -1;
            txtName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtSeller.Text = "";
            txtDescription.Text = "";
            FileUpload1.Attributes.Clear();
            lblMessage.Text = "";
            lblMessage2.Text = "";

        }

        
    }
}