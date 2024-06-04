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
    public partial class AddNewJob : System.Web.UI.Page
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
                GetJobCategory();
                GetCompanyInformation();
            }
        }

        public void GetJobCategory()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CategoryTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmdcategory.Items.Add(dr.GetString(1));
            }
            con.Close();
        }

        public void GetCompanyInformation()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CompanyRegTbl where Username='" + Application["username"] + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtcompanyname.Text = dr.GetString(1);
                txtcompanywebsite.Text = dr.GetString(2);
                txtcompanyemailid.Text = dr.GetString(3);
                txtstate.Text = dr.GetString(6);
                txtcountry.Text = dr.GetString(5);
                txtaddress.Text = dr.GetString(7);
                companylogo.ImageUrl = dr.GetString(8);
                txtname.Text = dr.GetString(11);
                txtmobileno.Text = dr.GetString(13);
            }
            con.Close();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into JobPostTbl values(@jobtitle,@noofpost,@jobdescripation,@education,@experence,@skill,@salary,@lastdatetoapply,@jobtype,@jobcategory,@joblocation,@jobstatus,@cname,@cwebsite,@cemailid,@clogo,@state,@country,@address,@cpersonename,@cpersonemobileno)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@jobtitle", txtjobtitle.Text);
            cmd.Parameters.AddWithValue("@noofpost", txtnumberofpost.Text);
            cmd.Parameters.AddWithValue("@jobdescripation", txtjobdescripation.Text);
            cmd.Parameters.AddWithValue("@education", txteducation.Text);
            cmd.Parameters.AddWithValue("@experence", cmdexperience.SelectedValue);
            cmd.Parameters.AddWithValue("@skill", txtspeciallzation.Text);
            cmd.Parameters.AddWithValue("@salary", txtsalary.Text);
            cmd.Parameters.AddWithValue("@lastdatetoapply", txtlastdatetoapply.Value.ToString());
            cmd.Parameters.AddWithValue("@jobtype", cmdjobtype.SelectedValue);
            cmd.Parameters.AddWithValue("@jobcategory", cmdcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@joblocation", txtjoblocation.Text);
            cmd.Parameters.AddWithValue("@jobstatus", cmdjobstatus.SelectedValue);
            cmd.Parameters.AddWithValue("@cname", txtcompanyname.Text);
            cmd.Parameters.AddWithValue("@cwebsite", txtcompanywebsite.Text);
            cmd.Parameters.AddWithValue("@cemailid", txtcompanyemailid.Text);
            cmd.Parameters.AddWithValue("@clogo", companylogo.ImageUrl.ToString());
            cmd.Parameters.AddWithValue("@state", txtstate.Text);
            cmd.Parameters.AddWithValue("@country", txtcountry.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@cpersonename", txtname.Text);
            cmd.Parameters.AddWithValue("@cpersonemobileno", txtmobileno.Text);

            con.Open();

            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Write("<script>alert('Job Post Successfuly.....')</script>");
                GetJobCategory();
                GetCompanyInformation();
                ClearData();
            }
            con.Close();

        }

        public void ClearData()
        {
            txtjobtitle.Text = string.Empty;
            txtnumberofpost.Text = string.Empty;
            txtjobdescripation.Text = string.Empty;
            txteducation.Text = string.Empty;
            txteducation.Text = string.Empty;
            cmdexperience.SelectedValue = "Select Experience";
            txtspeciallzation.Text = string.Empty;
            txtsalary.Text = string.Empty;
            cmdjobtype.SelectedValue = "Select Job Type";
            cmdcategory.SelectedValue = "Select Job Category";
            txtjoblocation.Text = string.Empty;
            cmdjobstatus.SelectedValue = "Select Job Status";

        }
    }
}