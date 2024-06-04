﻿using System;
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

namespace OnlineJobPortalWebsite.Company
{
    public partial class TakeActionPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdForTakeAction"] != null)
            {
                GetData();
            }
            else
            {
                Response.Redirect("../Company/ManageAppliedCandidate.aspx");
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

        public void GetData()
        {

            int id = int.Parse(Session["IdForTakeAction"].ToString());
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from JobAppliedTbl where JAId='" + id + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ViewState["JAId"] = dr.GetInt32(0).ToString();
                    ViewState["UId"] = dr.GetInt32(1).ToString();
                    ViewState["JId"] = dr.GetInt32(2).ToString();

                    lbljobtitle.Text = dr.GetString(3);
                    lblcompanyname.Text = dr.GetString(4);
                    lbleducation.Text = dr.GetString(5);
                    lblexperience.Text = dr.GetString(6);
                    lbllocation.Text = dr.GetString(7);
                    lblsalary.Text = dr.GetString(8);
                    lblskills.Text = dr.GetString(9);
                    lblapplieddate.Text = dr.GetString(10);
                    lblname.Text = dr.GetString(11);
                    lblemail.Text = dr.GetString(12);
                    txtemailid.Text = dr.GetString(12);
                    lblmobile.Text = dr.GetString(13);
                    Userimage.ImageUrl = dr.GetString(15);
                    lbllastdate.Text = dr.GetString(16);

                }
            }
            con.Close();

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            //onlinejobportal119 @gmail.com
            try
            {


                string frommail = "jobfinder612@gmail.com";
                 string frompassword = "jexqoebxzlzfknyr";        
                
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress(frommail);
                msg.Subject = "Applied Job Application Status :";
                msg.To.Add(txtemailid.Text);
                msg.Body = "Company Name :- " + lblcompanyname.Text + "<br/>" + " Job Title :- " + lbljobtitle.Text + "<br/>" + " Application Status :- " + cmdstatus.SelectedValue.ToString() + "<br/>" + " Message :- "  + txtmessage.Text;
                msg.IsBodyHtml = true;

                var client = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(frommail,frompassword),
                    EnableSsl = true,
                };

                client.Send(msg);
            

                int JAId = int.Parse(ViewState["JAId"].ToString());
                int UId = int.Parse(ViewState["UId"].ToString());
                int JId = int.Parse(ViewState["JId"].ToString());
                SqlConnection con = new SqlConnection(cs);
                string query = "insert into AppliedCandidateStatusTbl values(@jaid,@uid,@jid,@status,@msg)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@jaid", JAId);
                cmd.Parameters.AddWithValue("@uid", UId);
                cmd.Parameters.AddWithValue("@jid", JId);
                cmd.Parameters.AddWithValue("@status", cmdstatus.SelectedValue);
                cmd.Parameters.AddWithValue("@msg", txtmessage.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Message Send Successfuly')</script>");
                    txtmessage.Text = string.Empty;
                    cmdstatus.SelectedValue = "Select Status";
                }
                else
                {
                    Response.Write("<script>alert('Message Not Send')</script>");
                }


            }
            catch
            {
                Response.Write("<script>alert('Message Not Sent....')</script>");
            }


        }


    }
}