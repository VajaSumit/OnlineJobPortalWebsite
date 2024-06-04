using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.User
{
    public partial class ContactUs : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetData();
            }

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            try
            {
               con = new SqlConnection(cs);
                string query = "insert into ContactTbl values(@msg,@name,@email,@subject)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@msg", message.Value.ToString());
                cmd.Parameters.AddWithValue("@name", name.Value.ToString());
                cmd.Parameters.AddWithValue("@email", email.Value.ToString());
                cmd.Parameters.AddWithValue("@subject", subject.Value.ToString());
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    lblmsg.Text = "Thanks For reaching out will look into your query...";
                    lblmsg.Visible = true;
                    lblmsg.CssClass = "alert alert-success";
                    ClearData();
                }
                else
                {
                    lblmsg.Text = "Cannot save record right now , please try after sometime....";
                    lblmsg.Visible = true;
                    lblmsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"')</script>");
            }

            finally
            {
                con.Close();
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




        public void ClearData()
        {
            name.Value = string.Empty;
            email.Value = string.Empty;
            message.Value = string.Empty;
            subject.Value = string.Empty;
        }

    }
}