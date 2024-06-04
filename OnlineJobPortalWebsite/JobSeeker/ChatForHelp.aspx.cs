using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.JobSeeker
{
    public partial class ChatForHelp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetData();
            }

            if (Application["username"] == null)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Login First..')</script>");
                Response.Redirect("../User/Default.aspx");

            }
            else
            {
                ((Label)Master.FindControl("mylable")).Text = Application["username"].ToString();
            }

        }

        public void GetData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from ContactUsTbl ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblemail.Text = dr.GetString(1);
                lblmobile.Text = dr.GetString(2);
                lbladdress.Text = dr.GetString(3);
            }
            con.Close();
        }
    }
}