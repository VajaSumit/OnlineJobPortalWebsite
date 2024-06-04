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
    public partial class JobListPage : System.Web.UI.Page
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
                GetCategory();
                MyPage();
            }
        }

        public void GetData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from JobPostTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Open();
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();
            con.Close();
        }

        //protected void btnmoredetails_Click(object sender, EventArgs e)
        //{
        //    int id = int.Parse(((sender as LinkButton).NamingContainer.FindControl("lblJobId") as Label).Text);
        //    Session["idforsinglejob"] = id.ToString();
        //    Response.Redirect("../JobSeeker/JobDetails.aspx");
        //}

        protected void btnviewdetails_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((sender as Button).NamingContainer.FindControl("lblJobId") as Label).Text);
            Session["idforsinglejob"] = id.ToString();
            Response.Redirect("../JobSeeker/JobDetails.aspx");
        }

        public void GetCategory()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CategoryTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            dropdownforcategory.DataTextField = "CName";
            dropdownforcategory.DataValueField = "CName";
            dropdownforcategory.DataSource = data;
            dropdownforcategory.DataBind();

            ListItem select = new ListItem("Select JobCategory", "Select JobCategory", true);
            select.Selected = true;
            dropdownforcategory.Items.Insert(0, select);
        }


        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (txtjobtitle.Text == "")
            {
                Response.Write("<script>alert('Please Enter The job title..')</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl WHERE JobTitle LIKE @nm + '%' ";
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
                    Repeater1.DataSource = data;
                    Repeater1.DataBind();
                    //Response.Write("<script>alert('Data Found...')</script>");
                    lbldisplaymsg.Text = "Job Found...";
                    lbldisplaymsg.Visible = true;
                }
                else
                {
                    lbldisplaymsg.Text = "Job Not Found...";
                    lbldisplaymsg.Visible = true;
                    //GetData();
                }
            }
        }

        protected void btnsearch2_Click(object sender, EventArgs e)
        {
            string category = dropdownforcategory.SelectedValue.ToString();
            string jobtype = dropdownforjobtype.SelectedValue.ToString();
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from JobPostTbl WHERE  JobCategory='" + category + "' or JobType='"+ jobtype +"' or JobLocation='"+ txtjoblocation.Text +"' ";
            SqlCommand cmd = new SqlCommand(query, con);
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
                lbldisplaymsg.Text = "Job Found...";
                lbldisplaymsg.Visible = true;
            }
            else
            {
                lbldisplaymsg.Text = "Job Not Found...";
                lbldisplaymsg.Visible = true;
                //lbldisplaymsg.ForeColor = System.Drawing.Color.Red;
                //GetData();
            }
        }

        protected void dropdownforjobtype_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dropdownforcategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            string category = dropdownforcategory.SelectedValue.ToString();
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from JobPostTbl where JobCategory='" + category + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();

        }

        protected void btnsort_Click(object sender, EventArgs e)
        {
            if (cmdsortby.SelectedValue == "JobTitle")
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl order by JobTitle";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
            if (cmdsortby.SelectedValue == "Vacancy")
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl order by NumberOfPost";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
            if (cmdsortby.SelectedValue == "Salary")
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl order by Salary";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
            
            if (cmdsortby.SelectedValue == "Experience")
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from JobPostTbl order by Experience";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
        }

        public void MyPage()
        {
            string pagequery = " offset 0 rows FETCH NEXT 10 rows only﻿";  //Initially fetch the first 10 rows
            int page = 1; //Initialize page no 1
            int rowRemove = 10; // Rows to remove for next paging
            int pagesize = 10; //No of rows in a page

            if (!string.IsNullOrEmpty(Request.QueryString["pn"]))  //checks if query string [pn] is empty or no
            {
                page = Request.QueryString["pn"] == null ? 1 : Convert.ToInt32(Request.QueryString["pn"]);  //if not empty assign page=[pn]
                rowRemove = (rowRemove * Convert.ToInt32(page)) - 10; //calculate on removing the no of rows from the record
                pagequery = " offset " + rowRemove + " rows FETCH NEXT 10 rows only﻿"; //Fetch the next 10 rows after removing
            }

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmdRepeater = new SqlCommand("select * from JobPostTbl order by Id Asc" + pagequery, con);  //Select the records
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmdRepeater);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {

                Repeater1.DataSource = ds;
                Repeater1.DataBind();  //Bind the repeater
                cmdRepeater = new SqlCommand("select COUNT(*) from JobPostTbl", con);  //Count the total records
                con.Open();
                int count = (int)cmdRepeater.ExecuteScalar();
                con.Close();

                var uri = new Uri(Request.Url.AbsoluteUri);
                var query = HttpUtility.ParseQueryString(uri.Query); //Get the query strings from the url
                query.Remove("pn"); //Remove the query string [pn] to avoid repetation
                string link = HttpContext.Current.Request.Url.AbsolutePath + "?" + query;
                pagingDiv.InnerHtml = Set_Paging(page, pagesize, count, "activeLink", link, "disableLink");  //Fill the pagination in the div tag
            }
        }

        public string Set_Paging(Int32 PageNumber, int PageSize, Int64 TotalRecords, string ClassName, string PageUrl, string DisableClassName)
        {
            string ReturnValue = "";
            try
            {
                Int64 TotalPages = Convert.ToInt64(Math.Ceiling((double)TotalRecords / PageSize));
                if (PageNumber > 1)
                {
                    if (PageNumber == 2)
                        ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim() + "?pn=" + Convert.ToString(PageNumber - 1) + "' class='" + ClassName + "'> Prev </a>&nbsp;&nbsp;&nbsp;";
                    else
                    {
                        ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim();
                        if (PageUrl.Contains("?"))
                            ReturnValue = ReturnValue + "&";
                        else
                            ReturnValue = ReturnValue + "?";
                        ReturnValue = ReturnValue + "pn=" + Convert.ToString(PageNumber - 1) + "' class='" + ClassName + "'> Prev </a>&nbsp;&nbsp;&nbsp;";
                    }
                }
                else
                    ReturnValue = ReturnValue + "<span class='" + DisableClassName + "'> Prev </span>&nbsp;&nbsp;&nbsp;";
                if ((PageNumber - 4) > 1)
                    ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim() + "' class='" + ClassName + "'>1</a>&nbsp;.....&nbsp;&nbsp;";
                for (int i = PageNumber - 3; i <= PageNumber; i++)
                    if (i >= 1)
                    {
                        if (PageNumber != i)
                        {
                            ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim();
                            if (PageUrl.Contains("?"))
                                ReturnValue = ReturnValue + "&";
                            else
                                ReturnValue = ReturnValue + "?";
                            ReturnValue = ReturnValue + "pn=" + i.ToString() + "' class='" + ClassName + "'>" + i.ToString() + "</a>";
                        }
                        else
                        {
                            ReturnValue = ReturnValue + "<span style='font-weight: bold; background-color: #ff0600; color: #fff; padding: 5px; border-radius: 3px;'>" + i + "</span>";
                        }
                    }
                for (int i = PageNumber + 1; i <= PageNumber + 4; i++)
                    if (i <= TotalPages)
                    {
                        if (PageNumber != i)
                        {
                            ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim();
                            if (PageUrl.Contains("?"))
                                ReturnValue = ReturnValue + "&";
                            else
                                ReturnValue = ReturnValue + "?";
                            ReturnValue = ReturnValue + "pn=" + i.ToString() + "' class='" + ClassName + "'>" + i.ToString() + "</a>";
                        }
                        else
                        {
                            ReturnValue = ReturnValue + "<span style='font-weight:bold;'>" + i + "</span>";
                        }
                    }
                if ((PageNumber + 3) < TotalPages)
                {
                    ReturnValue = ReturnValue + ".....&nbsp;<a href='" + PageUrl.Trim();
                    if (PageUrl.Contains("?"))
                        ReturnValue = ReturnValue + "&";
                    else
                        ReturnValue = ReturnValue + "?";
                    ReturnValue = ReturnValue + "pn=" + TotalPages.ToString() + "' class='" + ClassName + "'>" + TotalPages.ToString() + "</a>";
                }
                if (PageNumber < TotalPages)
                {
                    ReturnValue = ReturnValue + "<a href='" + PageUrl.Trim();
                    if (PageUrl.Contains("?"))
                        ReturnValue = ReturnValue + "&";
                    else
                        ReturnValue = ReturnValue + "?";
                    ReturnValue = ReturnValue + "pn=" + Convert.ToString(PageNumber + 1) + "' class='" + ClassName + "'> Next </a>";
                }
                else
                    ReturnValue = ReturnValue + "<span class='" + DisableClassName + "'> Next </span>";
            }
            catch (Exception ex)
            {
            }
            return (ReturnValue);
        }

    }
}