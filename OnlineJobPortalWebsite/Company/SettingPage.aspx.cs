using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortalWebsite.Company
{
    public partial class SettingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["username"] == null)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Login First..')</script>");
                Response.Redirect("../User/Default.aspx");

            }
            else
            {
                ((Label)Master.FindControl("lblcompanyname")).Text = Application["username"].ToString();
            }
        }
    }
}