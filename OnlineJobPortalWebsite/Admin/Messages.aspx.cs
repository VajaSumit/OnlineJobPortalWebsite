using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class Messages : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
                GetEmailID();
                GetToEmailID();
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

        public void GetData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from MessageTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            DataGridViewForDisplayData.DataSource = data;
            DataGridViewForDisplayData.DataBind();
        }

        public void GetToEmailID()
        {
            if (Session["replayid"] != null)
            {
                int id = int.Parse(Session["replayid"].ToString());
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from ContactTbl where Id='" + id + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtto.Text = dr.GetString(3);
                }
                con.Close();

            }
        }

        public void GetEmailID()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from ContactUsTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtfrom.Text = dr.GetString(1);
            }
            con.Close();
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            try
            {
                string frommail = "jobfinder612@gmail.com";
                string frompassword = "jexqoebxzlzfknyr";

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress(frommail);
                msg.Subject = txtsubject.Text;
                msg.To.Add(txtto.Text);
                msg.Body = txtdescripation.Text;
                msg.IsBodyHtml = true;

                var client = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(frommail, frompassword),
                    EnableSsl = true,
                };
                client.Send(msg);


                SqlConnection con = new SqlConnection(cs);
                string query = "insert into MessageTbl values(@from,@to,@subject,@desc)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@from", txtfrom.Text);
                cmd.Parameters.AddWithValue("@to", txtto.Text);
                cmd.Parameters.AddWithValue("@subject", txtsubject.Text);
                cmd.Parameters.AddWithValue("@desc", txtdescripation.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Message Sent Successfuly....')</script>");
                    ClearData();
                    GetEmailID();
                    GetData();
                }

            }
            catch
            {
                    Response.Write("<script>alert('Message Not Sent....')</script>");
            }



        }

        private void ClearData()
        {
            txtfrom.Text = string.Empty;
            txtto.Text = string.Empty;
            txtsubject.Text = string.Empty;
            txtdescripation.Text = string.Empty;

        }

        protected void DataGridViewForDisplayData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataGridViewForDisplayData.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void DataGridViewForDisplayData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from MessageTbl where Id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Delete Successfuly...')</script>");
                GetData();
            }
            con.Close();
        }
    }
}