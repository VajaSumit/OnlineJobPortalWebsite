using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetNotificationMessages();
                GetTotalMessageCount();
            }
        }

        public void GetNotificationMessages()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select top(2) * from ContactTbl";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }

        public void GetTotalMessageCount()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select Count(Id) from ContactTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a =  Convert.ToInt32(cmd.ExecuteScalar());
            lbltotalmessagecount.Text = a.ToString();
            con.Close();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}