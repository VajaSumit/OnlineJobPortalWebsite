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
    public partial class LoginPage : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //showPassword();


                HttpCookie cookie = Request.Cookies["user"];
                if (cookie != null)
                {
                    txtusername.Text = cookie["uname"].ToString();
                    txtpassword.TextMode = TextBoxMode.SingleLine;
                    txtpassword.Text = cookie["pass"].ToString();
                    chkRememberME.Checked = true;
                    chkshowpass.Checked = true;


                }
            }
            
        }

        //protected void btnregistration_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("RegistrationPageForJS.aspx");

        //    //Server.Transfer("../User/RegistrationPageForJS.aspx");
        //}

        protected void btnlogin_Click(object sender, EventArgs e)
        {

            if (chkRememberME.Checked==true)
            {
                HttpCookie cookie = new HttpCookie("user");
                cookie["uname"] = txtusername.Text;
                cookie["pass"] = txtpassword.Text;
                cookie.Expires = DateTime.Now.AddDays(20);
                Response.Cookies.Add(cookie);
            }
            else
            {
                HttpCookie cookie = new HttpCookie("user");
                cookie["uname"] = txtusername.Text;
                cookie["pass"] = txtpassword.Text;
                cookie.Expires = DateTime.Now.AddDays(-20);
                Response.Cookies.Add(cookie);
            }
            if (cmbusertype.SelectedValue.ToString() == "Job-Seeker")
            {
                LoginForJobSeeker();
            }
            else if(cmbusertype.SelectedValue.ToString() == "Admin")
            {
                LoginForAdmin();
            }
            else if(cmbusertype.SelectedValue.ToString()=="Job-Hire")
            {
                LoginForJobHire();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Please Select The Usertype.....')</script>");
            }




        }


         public void LoginForJobSeeker()
        {
           
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from RegistrationForJSTbl where Username=@uname and Password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uname", txtusername.Text);
            cmd.Parameters.AddWithValue("@pass", txtpassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                
                //while (dr.Read())
                //{
                //    Application["id"] = dr.GetInt32(0);
                //    Application["username"] = dr.GetString(1);
                //}
                dr.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Successfuly')</script>");
                Application["username"] = txtusername.Text;
                Response.Redirect("../JobSeeker/Default.aspx");
                ClearData();
               
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Faild... please enter the current username and password and select a valid user-type')</script>");
                ClearData();

            }
            con.Close();
        }


        public void LoginForAdmin()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from AdminTbl where Username=@uname and Password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uname", txtusername.Text);
            cmd.Parameters.AddWithValue("@pass", txtpassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Successfuly')</script>");
                Application["username"] = txtusername.Text;
                ClearData();
                Response.Redirect("../Admin/default.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Faild... please enter the current username and password')</script>");
                ClearData();

            }
            con.Close();
        }


        public void LoginForJobHire()
        {

            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CompanyRegTbl where Username=@uname and Password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uname", txtusername.Text);
            cmd.Parameters.AddWithValue("@pass", txtpassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Successfuly')</script>");
                Application["username"] = txtusername.Text;
                Response.Redirect("../Company/dashboard.aspx");
                ClearData();

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login Faild... please enter the current username and password and select a valid user-type')</script>");
                ClearData();

            }
            con.Close();
        }

        public void ClearData()
        {
            cmbusertype.SelectedValue = "Select Usertype";
            txtusername.Text = string.Empty;
            txtpassword.Text = string.Empty;
            chkRememberME.Checked = false;


        }



 

        protected void chkshowpass_CheckedChanged(object sender, EventArgs e)
        {
            if (chkshowpass.Checked == true)
            {
                txtpassword.TextMode = TextBoxMode.SingleLine;
            }
            else if(chkshowpass.Checked==false)
            {
                txtpassword.TextMode = TextBoxMode.Password;
            }
        }
    }
}