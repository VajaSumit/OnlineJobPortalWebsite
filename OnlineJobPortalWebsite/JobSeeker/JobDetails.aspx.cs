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
    public partial class JobDetails : System.Web.UI.Page
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
                ((Label)Master.FindControl("mylable")).Text = Application["username"].ToString();
            }

            if (!IsPostBack)
            {
                GetData();
                GetUserData();
            }

        }

        public void GetData()
        {
            if (Session["idforsinglejob"] != null)
            {
                int id = int.Parse(Session["idforsinglejob"].ToString());
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl where Id='" + id +"' ";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        int Jid = dr.GetInt32(0);
                        Session["JobId"] = Jid.ToString();
                        lbljobtitle1.Text = dr.GetString(1);
                        lbljobtitle2.Text = dr.GetString(1);
                        lblnumberofpost.Text = dr.GetInt32(2).ToString();
                        lbljobdescripation.Text = dr.GetString(3);
                        lbleducation.Text = dr.GetString(4);
                        lblexperience.Text = dr.GetString(5);
                        lblskills.Text = dr.GetString(6);
                        lblsalary.Text = dr.GetString(7);
                        lblsalary2.Text = dr.GetString(7);
                        lbllastdatetoapply.Text = dr.GetString(8);
                        lbljobtype.Text = dr.GetString(9);
                        lbljobcategory.Text = dr.GetString(10);
                        lbljoblocation1.Text = dr.GetString(11);
                        lbljoblocation2.Text = dr.GetString(11);
                        lblstatus.Text = dr.GetString(12);
                        lblcompanyname.Text = dr.GetString(13);
                        lblcompanyname1.Text = dr.GetString(13);
                        lblcompanywebsite.Text = dr.GetString(14);
                        lblcompanyemailid.Text = dr.GetString(15);
                        companylogo.ImageUrl = dr.GetString(16);
                        lblstate.Text = dr.GetString(17);
                        lblcountry.Text = dr.GetString(18);
                        lbladdress.Text = dr.GetString(19);
                        lblcontactpersonename.Text = dr.GetString(20);
                        lblcontactpersonemobile.Text = dr.GetString(21);

                    }
                }
                con.Close();
            }
            else
            {
                Response.Redirect("../JobSeeker/JobListPage.aspx");
            }
        }

        public void GetUserData()
        {
            string username = Application["username"].ToString();
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from RegistrationForJSTbl where Username='"+ username +"'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    Session["JobSeekerID"] = id.ToString();
                    string name = dr.GetString(3);
                    Session["JobSeekerName"] = name;
                    string email = dr.GetString(6);
                    Session["JobSeekerEmail"] = email;
                    string mobileno = dr.GetString(7);
                    Session["JobSeekerMobile"] = mobileno;
                    string image = dr.GetString(11);
                    Session["JobSeekerImage"] = image;
                    string resume = dr.GetString(14);
                    Session["JobSeekerResume"] = resume;


                }
            }
            con.Close();

           
        }

        protected void btnapply_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(Session["JobSeekerID"].ToString());
            int JID = int.Parse(Session["JobId"].ToString());
            string name = Session["JobSeekerName"].ToString();
            string email = Session["JobSeekerEmail"].ToString();
            string mobileno = Session["JobSeekerMobile"].ToString();
            string resume = Session["JobSeekerResume"].ToString();
            string userimage = Session["JobSeekerImage"].ToString();

            string date = DateTime.Now.ToString("dd/MM/yyyy");

            SqlConnection con = new SqlConnection(cs);
            string query = "insert into JobAppliedTbl values(@id,@jid,@jobtitle,@companyname,@education,@experience,@location,@salary,@skills,@applieddate,@username,@email,@mobile,@resume,@image,@lastdate)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@jid", JID);
            cmd.Parameters.AddWithValue("@jobtitle", lbljobtitle1.Text);
            cmd.Parameters.AddWithValue("@companyname", lblcompanyname.Text);
            cmd.Parameters.AddWithValue("@education", lbleducation.Text);
            cmd.Parameters.AddWithValue("@experience", lblexperience.Text);
            cmd.Parameters.AddWithValue("@location", lbljoblocation1.Text);
            cmd.Parameters.AddWithValue("@salary", lblsalary.Text);
            cmd.Parameters.AddWithValue("@skills", lblskills.Text);
            cmd.Parameters.AddWithValue("@applieddate", date);
            cmd.Parameters.AddWithValue("@username", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mobile", mobileno);
            cmd.Parameters.AddWithValue("@resume", resume);
            cmd.Parameters.AddWithValue("@image", userimage);
            cmd.Parameters.AddWithValue("@lastdate", lbllastdatetoapply.Text);


            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Your Job Application Successfuly Done...')</script>");
                btnapply.Enabled = false;
            }
            else
            {
                Response.Write("<script>alert('Your Job Application Faild...')</script>");
            }
        }
    }
}