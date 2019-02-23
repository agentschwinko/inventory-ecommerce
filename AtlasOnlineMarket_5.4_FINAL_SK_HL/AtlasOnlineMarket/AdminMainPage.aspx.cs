using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtlasOnlineMarket
{
    public partial class AdminMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var queryString = Request.QueryString;
           int userID = int.Parse(queryString["sID"]);
            Session["uid"] = userID;
        }
    }
}