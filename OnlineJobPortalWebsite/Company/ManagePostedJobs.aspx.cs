﻿using System;
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
    public partial class AllJobList : System.Web.UI.Page
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
                ((Label)Master.FindControl("lblcompanyname")).Text = Application["username"].ToString();
            }
        }

        protected void DataGridViewForDisplayData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from JobPostTbl where Id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Delete Successfuly...')</script>");
                GetData();
            }
            con.Close();
        }

        protected void DataGridViewForDisplayData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataGridViewForDisplayData.PageIndex = e.NewPageIndex;
            this.GetData();
        }

        //protected void DataGridViewForDisplayData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int Id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('You Updating Id is : '"+ Id +"' ')</script>");
        //}

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from JobPostTbl WHERE JobTitle LIKE '%' + @nm + '%' ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nm", txtjobtitle.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                DataGridViewForDisplayData.DataSource = data;
                DataGridViewForDisplayData.DataBind();
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
                string query = "select *from JobPostTbl";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                DataGridViewForDisplayData.DataSource = data;
                DataGridViewForDisplayData.DataBind();
            }
        }

        protected void DataGridViewForDisplayData_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = DataGridViewForDisplayData.SelectedRow;
            //string jobtitle = DataGridViewForDisplayData.SelectedRow.Cells[2].Text;
            Label lbljobtitle = (Label)row.FindControl("lbljobtitle");
            Label lblnumberofpost = (Label)row.FindControl("lblnumberofpost");
            Label lbljobdescripation = (Label)row.FindControl("lbljobdescripation");
            Label lbleducation = (Label)row.FindControl("lbleducation");
            Label lblexperience = (Label)row.FindControl("lblexperience");
            Label lblskills = (Label)row.FindControl("lblskills");
            Label lblsalary = (Label)row.FindControl("lblsalary");
            Label lbllastdatetoapply = (Label)row.FindControl("lbllastdatetoapply");
            Label lbljobtype = (Label)row.FindControl("lbljobtype");
            Label lbljobcategory = (Label)row.FindControl("lbljobcategory");
            Label lbljoblocation = (Label)row.FindControl("lbljoblocation");
            Label lbljobstatus = (Label)row.FindControl("lbljobstatus");
            Label lblcname = (Label)row.FindControl("lblcname");
            Label lblcwebsite = (Label)row.FindControl("lblcwebsite");
            Label lblcemail = (Label)row.FindControl("lblcemail");
            //string lblclogo = row.FindControl("lblclogo").ToString();
            Label lblstate = (Label)row.FindControl("lblstate");
            Label lblcountry = (Label)row.FindControl("lblcountry");
            Label lbladdress = (Label)row.FindControl("lbladdress");
            Label lblcpersonename = (Label)row.FindControl("lblcpersonename");
            Label lblcpersonemobileno = (Label)row.FindControl("lblcpersonemobileno");

            Session["lbljobtitle"] = lbljobtitle.Text;
            Session["lblnumberofpost"] = lblnumberofpost.Text;
            Session["lbljobdescripation"] = lbljobdescripation.Text;
            Session["lbleducation"] = lbleducation.Text;
            Session["lblexperience"] = lblexperience.Text;
            Session["lblskills"] = lblskills.Text;
            Session["lblsalary"] = lblsalary.Text;
            Session["lbllastdatetoapply"] = lbllastdatetoapply.Text;
            Session["lbljobtype"] = lbljobtype.Text;
            Session["lbljobcategory"] = lbljobcategory.Text;
            Session["lbljoblocation"] = lbljoblocation.Text;
            Session["lbljobstatus"] = lbljobstatus.Text;
            Session["lblcname"] = lblcname.Text;
            Session["lblcwebsite"] = lblcwebsite.Text;
            Session["lblcemail"] = lblcemail.Text;
            //Session["lblclogo"] = lblclogo;
            Session["lblstate"] = lblstate.Text;
            Session["lblcountry"] = lblcountry.Text;
            Session["lbladdress"] = lbladdress.Text;
            Session["lblcpersonename"] = lblcpersonename.Text;
            Session["lblcpersonemobileno"] = lblcpersonemobileno.Text;


            Response.Redirect("../Company/UpdateThePostedJob.aspx");
        }
    }
}