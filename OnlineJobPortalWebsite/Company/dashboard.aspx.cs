using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.Company
{
    public partial class _default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

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

            if (!IsPostBack)
            {
                GetTheTotalEmployeer();
                GetTheTotalPostedJobs();
                GetTheTotalAppliedJobCandidates();
                GetTheTotalApprovalApplication();
            }
        }


        public void GetTheTotalEmployeer()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select Count(Id) from CompanyRegTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = Convert.ToInt32(cmd.ExecuteScalar());
            lblregistredcompanies.Text = a.ToString();
            con.Close();
        }

        public void GetTheTotalPostedJobs()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select Count(Id) from JobPostTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = Convert.ToInt32(cmd.ExecuteScalar());
            lblnoofpostedjobs.Text = a.ToString();
            con.Close();
        }

        public void GetTheTotalAppliedJobCandidates()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select Count(JAId) from JobAppliedTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = Convert.ToInt32(cmd.ExecuteScalar());
            lblappliedcandidates.Text = a.ToString();
            con.Close();
        }

        public void GetTheTotalApprovalApplication()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select Count(ACSID) from AppliedCandidateStatusTbl where Status='Approved' ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = Convert.ToInt32(cmd.ExecuteScalar());
            lblapprovalapplication.Text = a.ToString();
            con.Close();
        }
    }
}