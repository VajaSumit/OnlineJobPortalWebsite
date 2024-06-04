using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class Notifications : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from ContactTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }

        protected void btnreplay_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((sender as Button).NamingContainer.FindControl("lblid") as Label).Text);
            Session["replayid"] = id.ToString();
            Response.Redirect("../Admin/Messages.aspx");

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.CommandName == "Delete" && e.CommandArgument.ToString() != "")
            //{
            //    int id = Convert.ToInt32(DataGridViewForDisplayData.DataKeys[e.RowIndex].Values[0]);
            //    SqlConnection con = new SqlConnection(cs);
            //    string query = "delete from MessageTbl where Id=@id";
            //    SqlCommand cmd = new SqlCommand(query, con);
            //    cmd.Parameters.AddWithValue("@id", id);
            //    con.Open();
            //    int a = cmd.ExecuteNonQuery();
            //    if (a > 0)
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Data Delete Successfuly...')</script>");
            //        GetData();
            //    }
            //    con.Close();

            //}
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((sender as Button).NamingContainer.FindControl("lblid") as Label).Text);
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from ContactTbl where Id=@id";
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
    }
}