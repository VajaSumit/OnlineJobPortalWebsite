using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.JobSeeker
{
    public partial class FeedbackAndRattingPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
                RetriveFeedbackData();
                
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
                string query = "select *from RegistrationForJSTbl where Username=@uname";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uname", Application["username"].ToString());
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtfullname.Text = dr.GetString(3);
                        txtemail.Text = dr.GetString(6);
                        img1.Src = dr.GetString(11);
                        ViewState["name"] = dr.GetString(3);

                    }
                }
                con.Close();
            }
        }

        public void RetriveFeedbackData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from ReviewOrRatingTbl where name=@nm";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nm", ViewState["name"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read()){
                    txtmessage.Text = dr.GetString(3);
                    lbldate.Text = dr.GetString(5);
                    Rating1.CurrentRating = dr.GetInt32(6);
                }
            }
            con.Close();
        }

        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            Session["star"] = e.Value.ToString();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from ReviewOrRatingTbl where name=@nm";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nm", ViewState["name"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                //update query
                UpdateData();
            }
            else
            {
                //insert query
                InsertFeedback();
            }

        }


        public void InsertFeedback()
        {
            int star = Convert.ToInt32(Session["star"].ToString());
            lbldate.Text = "Date : " + DateTime.Now.ToString("dd/MM/yyyy");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("insert into ReviewOrRatingTbl values(@nm,@email,@msg,@img,@date,@star)",con);
            cmd.Parameters.AddWithValue("@nm", txtfullname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@msg", txtmessage.Text);
            cmd.Parameters.AddWithValue("@img", img1.Src);
            cmd.Parameters.AddWithValue("@date", lbldate.Text);
            cmd.Parameters.AddWithValue("@star",star);
            //SqlCommand cmd = new SqlCommand("exec InsertRettingorReview '" + txtfullname.Text + "' , '" + txtemail.Text + "' , '" + txtmessage.Text + "' , '" + img1.Src + "' , '" + lbldate.Text + "' , '" + Session["star"].ToString() + "' ", con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data Submit Successfuly...')</script>");
                GetData();
                RetriveFeedbackData();

            }
            con.Close();

        }


        public void UpdateData()
        {
            lbldate.Text = "Date : " + DateTime.Now.ToString("dd/MM/yyyy");
            SqlConnection con = new SqlConnection(cs);
            string query = "update ReviewOrRatingTbl set description=@desc , date=@date , star=@rate where name=@name ";
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@name", txtfullname.Text);
            cmd.Parameters.AddWithValue("@desc", txtmessage.Text);
            cmd.Parameters.AddWithValue("@date", lbldate.Text);
            cmd.Parameters.AddWithValue("@rate",Rating1.CurrentRating);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a>0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Update successfuly...')</script>");
                GetData();
                RetriveFeedbackData();
            }
            con.Close();
        }

    }
}