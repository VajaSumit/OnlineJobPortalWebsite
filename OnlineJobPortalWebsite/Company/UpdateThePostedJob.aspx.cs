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
    public partial class UpdateThePostedJob : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["lbljobtitle"] != null)
                {
                    GetJobCategory();
                    GetCompanyInformation();
                    GetData();


                }
                else
                {
                    Response.Redirect("../Company/dashboard.aspx");
                }
            }

            if (Application["username"] == null)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Login First..')</script>");
                Response.Redirect("../User/Default.aspx");

            }
            else
            {
                ((Label)Master.FindControl("lblcompanyname")).Text = Application["username"].ToString();
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection(cs);
            //string query = "select *from JobPostTbl where JobTitle=@jobtitle";
            //SqlCommand cmd = new SqlCommand(query, con);
            //cmd.Parameters.AddWithValue("@jobtitle", txtjobtitle.Text);
            //con.Open();
            //SqlDataReader dr = cmd.ExecuteReader();
            //if (dr.HasRows)
            //{
            //    Response.Write("<script>alert('Already Exist The Job In Database...Plz.Enter The Unique Job Title Name...')</script>");
            //    con.Close();
            //}
            //else
            //{
            //    UpdateData();
            //}
            UpdateData(); 
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Company/dashboard.aspx");
        }

        public void UpdateData()
        {
            

            SqlConnection con = new SqlConnection(cs);
            string query = "update JobPostTbl set JobTitle=@jobtitle,NumberOfPost=@noofpost,JobDescripation=@jobdescripation,Education=@education,Experience=@experence,Skills=@skill,Salary=@salary,LastDateToApply=@lastdatetoapply,JobType=@jobtype,JobCategory=@jobcategory,JobLocation=@joblocation,JobStatus=@jobstatus where JobTitle=@oldtitle";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@oldtitle", Session["lbljobtitle"].ToString());
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
            con.Open();

            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Write("<script>alert('JobPost Data Update Successfuly.....')</script>");
                GetJobCategory();
                ClearData();
                GetCompanyInformation();
            }
            con.Close();
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

        public void ClearData()
        {
            txtjobtitle.Text = string.Empty;
            txtnumberofpost.Text = string.Empty;
            txtjobdescripation.Text = string.Empty;
            txteducation.Text = string.Empty;
            cmdexperience.SelectedValue = "Select Experience";
            txtspeciallzation.Text = string.Empty;
            txtsalary.Text = string.Empty;
            txtlastdatetoapply.Value = DateTime.Now.ToString("MM/dd/yyyy");
            cmdjobtype.SelectedValue = "Select Job Type";
            cmdcategory.SelectedValue = "Select Job Category";
            txtjoblocation.Text = string.Empty;
            cmdjobstatus.SelectedValue = "Select Job Status";
        
        }
        public void GetData()
        {
            txtjobtitle.Text = Session["lbljobtitle"].ToString();
            txtnumberofpost.Text = Session["lblnumberofpost"].ToString();
            txtjobdescripation.Text = Session["lbljobdescripation"].ToString();
           txteducation.Text = Session["lbleducation"].ToString();
           cmdexperience.SelectedValue = Session["lblexperience"].ToString();
           txtspeciallzation.Text = Session["lblskills"].ToString();
           txtsalary.Text = Session["lblsalary"].ToString();
           txtlastdatetoapply.Value = Session["lbllastdatetoapply"].ToString();
           cmdjobtype.SelectedValue = Session["lbljobtype"].ToString();
           cmdcategory.SelectedValue = Session["lbljobcategory"].ToString();
           txtjoblocation.Text = Session["lbljoblocation"].ToString();
           cmdjobstatus.SelectedValue =  Session["lbljobstatus"].ToString();
         
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
    }
}