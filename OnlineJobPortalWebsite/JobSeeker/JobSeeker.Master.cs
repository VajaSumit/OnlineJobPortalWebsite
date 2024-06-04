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
    public partial class JobSeeker : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
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
                lblemail.Text = "Email : " + dr.GetString(1);
                lblmobileno.Text = "Phone No. : " + dr.GetString(2) + " (Monday - Friday | 9am - 6pm)";

            }
            con.Close();
        }

    }
}