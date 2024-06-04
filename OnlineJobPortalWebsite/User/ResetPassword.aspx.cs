using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace OnlineJobPortalWebsite.User
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        string GUIDvalue;
        DataTable dt = new DataTable();
        int Uid;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            GUIDvalue = Request.QueryString["Uid"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select *from ForgotPassRequests where id='" + GUIDvalue + "'" , con );
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid');</script>");
                }
            }
            else
            {
                Response.Redirect("~/User/ForgotPassword.aspx");
            }


            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtpassword.Visible = true;
                    txtconfirmpassword.Visible = true;
                    btnreset.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid');</script>");
                }

            }

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update RegistrationForJSTbl set Password='" + txtpassword.Text +"' where Id='" + Uid + "'",con);
            con.Open();
            cmd.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from ForgotPassRequests where Uid='" + Uid + "'", con);
            cmd2.ExecuteNonQuery();
            Response.Write("<script>alert('Password Successfully Changed..');</script>");

        }
    }
}