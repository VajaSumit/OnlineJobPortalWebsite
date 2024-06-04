using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class ManageCategory : System.Web.UI.Page
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

        protected void DataGridViewForDisplayData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
            Response.Write("<script>Confirm('Are You Sure You Want To Delete The Data..?)</script>");
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from CategoryTbl where CId=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Delete Successfuly...')</script>");
                DataGridViewForDisplayData.EditIndex = -1;
                GetData();
            }
            con.Close();
        }

        protected void DataGridViewForDisplayData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataGridViewForDisplayData.PageIndex = e.NewPageIndex;
            this.GetData();
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
                string query = "select *from CategoryTbl";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);
                DataGridViewForDisplayData.DataSource = data;
                DataGridViewForDisplayData.DataBind();
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into CategoryTbl values(@cname)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@cname",txtcategoryname.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Insert Successfuly...')</script>");
                txtcategoryname.Text = string.Empty;
                GetData();
            }
            con.Close();
        }

       

     

        protected void DataGridViewForDisplayData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DataGridViewForDisplayData.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void DataGridViewForDisplayData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Value.ToString());
            string cname = ((TextBox)DataGridViewForDisplayData.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            SqlConnection con = new SqlConnection(cs);
            string query = "update CategoryTbl set CName='"+cname+"' where CId='"+ id +"' ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Update Successfuly...')</script>");
                DataGridViewForDisplayData.EditIndex = -1;
                GetData();
            }
            con.Close();

        }

        protected void DataGridViewForDisplayData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DataGridViewForDisplayData.EditIndex = -1;
            GetData();
        }
    }
}