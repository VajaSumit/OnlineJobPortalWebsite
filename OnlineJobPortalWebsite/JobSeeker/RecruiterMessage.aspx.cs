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
    public partial class RecruiterMessage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetId();
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

        public void GetId()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from RegistrationForJSTbl where Username='" + Application["username"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["IDForDisplayRecruiterMessage"] = dr.GetInt32(0).ToString();
                }
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
                int UId = int.Parse(Session["IDForDisplayRecruiterMessage"].ToString());
                SqlConnection con = new SqlConnection(cs);
                string query = "SELECT *FROM JobAppliedTbl INNER JOIN AppliedCandidateStatusTbl ON JobAppliedTbl.JAId = AppliedCandidateStatusTbl.JAId WHERE AppliedCandidateStatusTbl.UId = @uid ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uid",UId);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            int UId = int.Parse(Session["IDForDisplayRecruiterMessage"].ToString());
            SqlConnection con = new SqlConnection(cs);
            string query = "SELECT *FROM JobAppliedTbl INNER JOIN AppliedCandidateStatusTbl ON JobAppliedTbl.JAId = AppliedCandidateStatusTbl.JAId WHERE JobAppliedTbl.JobTitle LIKE @nm + '%' AND AppliedCandidateStatusTbl.Status = @status AND AppliedCandidateStatusTbl.UId = @uid ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uid", UId);
            cmd.Parameters.AddWithValue("@nm", txtjobtitle.Text);
            cmd.Parameters.AddWithValue("@status", cmdstatus.SelectedValue);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
                //Response.Write("<script>alert('Data Found...')</script>");
                lblmsg.Text = "Data Found...";
                lblmsg.Visible = true;
            }
            else
            {
                lblmsg.Text = "Data Not Found...";
                lblmsg.Visible = true;
                GetData();
            }
        }
    }
}