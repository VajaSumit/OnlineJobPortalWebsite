using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class ManageCompanies : System.Web.UI.Page
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
                ((Label)Master.FindControl("lbladminname")).Text = Application["username"].ToString();
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
                string query = "select *from CompanyRegTbl";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                DataGridViewForDisplayData.DataSource = data;
                DataGridViewForDisplayData.DataBind();
            }
        }

        protected void DataGridViewForDisplayData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from CompanyRegTbl where Id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CompanyRegTbl WHERE PersoneName LIKE '%' + @nm + '%' ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nm", txtfullname.Text);
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
    }
}