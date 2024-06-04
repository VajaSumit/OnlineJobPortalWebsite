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
    public partial class Default : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        int num = 0;
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
                //BindTheData();
                num = 4;
                ViewState["num"] = num;
                BindReaptorWithDB(num);

            }
        }


        //public void BindTheData()
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    string query = "select *from ReviewOrRatingTbl";
        //    SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //    DataTable data = new DataTable();
        //    sda.Fill(data);
        //    Repeater1.DataSource = data;
        //    Repeater1.DataBind();

        //}

        protected void btnloadmore_Click(object sender, EventArgs e)
        {
            int numValue = Convert.ToInt32(ViewState["num"]) + 4;
            BindReaptorWithDB(numValue);
            ViewState["num"] = numValue;
        }

        public void BindReaptorWithDB(int NumberOfRows)
        {
            int rowsCount = GetTotalRowsOfFeedbacks();
            if (NumberOfRows > rowsCount)
            {
                btnloadmore.Visible = false;
                //Response.Write("<script>alert('No More Data')</script>");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('No More Data')</script>");
                lblmoredata.Visible = true;
            }

            SqlConnection con = new SqlConnection(cs);
            string query = "select top (@val) *from ReviewOrRatingTbl";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@val", NumberOfRows);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (data.Rows.Count > 0)
            {
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }
        }

        public int GetTotalRowsOfFeedbacks()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select count(Id) from ReviewOrRatingTbl";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return a;

        }
    }
}