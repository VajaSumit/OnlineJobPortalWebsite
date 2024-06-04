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
    public partial class UpdateContactasPage : System.Web.UI.Page
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
                ((Label)Master.FindControl("lbladminname")).Text = Application["username"].ToString();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(cs);
            string q = "select Id from ContactUsTbl";
            SqlCommand c = new SqlCommand(q, con1);
            SqlDataAdapter sda = new SqlDataAdapter(c);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (data.Rows.Count < 1)
            {
                InsertData();
            }
            else
            {
                UpdateData();
            }

        }

        public void InsertData()
        {

            SqlConnection con = new SqlConnection(cs);
            string query = "insert into ContactUsTbl values(@email,@mobile,@address)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mobile", txtMobileNo.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Insert Successfuly...')</script>");
                GetData();
            }
            con.Close();
        }

        public void UpdateData()
        {

            SqlConnection con = new SqlConnection(cs);
            string query = "update ContactUsTbl set Email=@email, Mobile=@mobile, Address=@address";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mobile", txtMobileNo.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Update Successfuly...')</script>");
                GetData();
            }
            con.Close();
        }

        public void GetData()
        {
            if (Application["username"] == null)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Login First..')</script>");
                Response.Redirect("../User/Default.aspx");

            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from ContactUsTbl ";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtemail.Text = dr.GetString(1);
                    txtMobileNo.Text = dr.GetString(2);
                    txtaddress.Text = dr.GetString(3);
                }
                con.Close();
            }
        }

    }
}