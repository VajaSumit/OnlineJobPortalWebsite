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
    public partial class AppliedCandidateWithsStatus : System.Web.UI.Page
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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (txtjobtitle.Text == "" && cmdstatus.SelectedValue == "Select Status")
            {
                lblmsg.Text = "Please Select Status and Enter The Job-Title..";
                lblmsg.Visible = true;
            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "SELECT *FROM JobAppliedTbl INNER JOIN AppliedCandidateStatusTbl ON JobAppliedTbl.JAId = AppliedCandidateStatusTbl.JAId WHERE JobAppliedTbl.JobTitle LIKE @nm + '%' AND AppliedCandidateStatusTbl.Status = @status ";
                SqlCommand cmd = new SqlCommand(query, con);
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
                string query = "SELECT *FROM JobAppliedTbl INNER JOIN AppliedCandidateStatusTbl ON JobAppliedTbl.JAId = AppliedCandidateStatusTbl.JAId";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((sender as Button).NamingContainer.FindControl("lblappliedcandidatestatusId") as Label).Text);
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from AppliedCandidateStatusTbl where ACSID=@id";
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