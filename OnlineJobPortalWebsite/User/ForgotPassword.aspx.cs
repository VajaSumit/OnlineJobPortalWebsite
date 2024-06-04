using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace OnlineJobPortalWebsite.User
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection(cs);
            //SqlCommand cmd = new SqlCommand("select *from RegistrationForJSTbl where Email='" + txtemailid.Text + "'", con);
            //con.Open();
            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            ////SqlDataReader dr = cmd.ExecuteReader();
            //if (dt.Rows.Count != 0)
            //{
            //    //if (dr.HasRows)
            //    //{

            //    string myGUID = Guid.NewGuid().ToString();
            //    int Uid = Convert.ToInt32(dt.Rows[0][0]);
            //    //int Uid = dr.GetInt32(0);
            //    SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequests values(@myguid,@uid,@date)", con);
            //    cmd1.Parameters.AddWithValue("@myguid", myGUID);
            //    cmd1.Parameters.AddWithValue("@uid", Uid);
            //    cmd1.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd/MM/yyyy"));
            //    cmd1.ExecuteNonQuery();

            //    //send email
            //    try
            //    {
            //        string ToEmailAddress = dt.Rows[0][6].ToString(); /*dr.GetString(6); */
            //        string Username = dt.Rows[0][1].ToString(); /*dr.GetString(1).ToString();*/
            //        string EmailBody = "Hi " + Username + ",<br/><br/> Click the link below to reset your password <br/><br/> http://localhost:64015/User/ResetPassword.aspx?Uid=" + myGUID;
            //        MailMessage PassRecMail = new MailMessage("onlinejobportal119@gmail.com", ToEmailAddress);
            //        PassRecMail.Body = EmailBody;
            //        PassRecMail.IsBodyHtml = true;
            //        PassRecMail.Subject = "Reset Password";
            //        PassRecMail.Priority = MailPriority.High;

            //        SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            //        SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
            //        SMTP.UseDefaultCredentials = false;
            //        SMTP.Credentials = new NetworkCredential("onlinejobportal119@gmail.com", "JobFinder@1234");
            //        //SMTP.Credentials = new NetworkCredential()
            //        //{
            //        //    UserName = "onlinejobportal119@gmail.com",
            //        //    Password = "JobFinder@123"

            //        //};
            //        SMTP.EnableSsl = true;
            //        SMTP.Send(PassRecMail);
            //        //Response.Write("<script>alert('Check your email to reset your password..');</script>");
            //        lblmsg.Text = "Check your email to reset your password..";
            //        txtemailid.Text = string.Empty;
            //    }
            //    catch (Exception ex)
            //    {
            //        //Response.Write("<script>alert('" + ex + "');</script>");
            //        lblmsg.Text = "Error.." + ex.Message.ToString();
            //    }
            //}
            //else
            //{
            //    //Response.Write("<script>alert('OPPS This email id DOES NOT exist in your database !..');</script>");
            //      lblmsg.Text= "OPPS This email id DOES NOT exist in your database !..";
            //}

            try
            {

                string frommail = "jobfinder612@gmail.com";
                string frompassword = "jexqoebxzlzfknyr";

               

                SqlConnection con = new SqlConnection(cs);
                string query = "select *from RegistrationForJSTbl where Email='" + txtemailid.Text + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    dr.Read();
                    string email = dr.GetString(6);
                    string username = dr.GetString(1);
                    string pw = dr.GetString(2);

                    //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //client.UseDefaultCredentials = false;
                    ////client.Credentials = new NetworkCredential("onlinejobportal119@gmail.com", "JobFinder@123");
                    //NetworkCredential NetCre = new NetworkCredential("jobfinder612@gmail.com", "jobfinder@1234");
                    //client.Credentials = NetCre;
                    //client.EnableSsl = true;
                    //MailMessage msg = new MailMessage("jobfinder612@gmail.com", txtemailid.Text,"Your Password",sb.ToString());
                    ////msg.To.Add(txtemailid.Text);
                    ////msg.From = new MailAddress("online job portal..< onlinejobportal119@gmail.com >");
                    ////msg.Subject = "Your Password";
                    ////msg.Body = sb.ToString();
                    //client.Send(msg);

                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress(frommail);
                    msg.Subject = "Your JonFinderWebsite Password :";
                    msg.To.Add(txtemailid.Text);
                    msg.Body = "Your Information :-  " + "<br />" + " Email-ID :- " + email + "<br/>" + " Username :- " + username + "<br/>" + " Password :- " + pw ;

                    msg.IsBodyHtml = true;

                    var client = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential(frommail, frompassword),
                        EnableSsl = true,
                    };

                    client.Send(msg);
                    lblmsg.Text = "Check your email , your password has been set to your email is..";
                    //Response.Write("<script>alert('Check your email , your password has been set to your email is..');</script>");

                    

                }
                else
                {
                    //Response.Write("<script>alert('Not Valid Email Id....')</script>");
                    lblmsg.Text = "Not Valid Email Id....";
                }

            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Error....')</script>");
                lblmsg.Text = "Error...." + ex.Message.ToString();
            }
        }

    }
}