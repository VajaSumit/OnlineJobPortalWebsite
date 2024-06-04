using System;
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
    public partial class ViewSingleCandidateDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdForViewDetails"] != null)
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
          
                int id = int.Parse(Session["IdForViewDetails"].ToString());
                SqlConnection con = new SqlConnection(cs);
                string query = "select *from RegistrationForJSTbl where Id='" + id + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblfullname.Text = dr.GetString(3);
                        lblgender.Text = dr.GetString(4);
                        lblbrithday.Text = dr.GetString(5);
                        lblemail.Text = dr.GetString(6);
                        lblmobile.Text = dr.GetString(7);
                        lblcountry.Text = dr.GetString(8);
                        lblstate.Text = dr.GetString(9);
                        lbladdress.Text = dr.GetString(10);
                        profileimage.ImageUrl  = dr.GetString(11);
                        lblskills.Text = dr.GetString(12);
                        lblaboutme.Text = dr.GetString(13);
                        ViewResume.HRef = dr.GetString(14);
                    }
                }
                con.Close();
          
        }



    }
}