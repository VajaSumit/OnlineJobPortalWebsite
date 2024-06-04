using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace OnlineJobPortalWebsite.Admin
{
    public partial class ProfilePage : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataRetrive();
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

        public void DataRetrive()
        {
            //int id = Convert.ToInt32(Session["id"]);
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from AdminTbl where Username=@uname";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uname", Application["username"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    txtusername.Text = dr.GetString(1);
                    txtpassword.Text = dr.GetString(2);
                    txtfullname.Text = dr.GetString(3);
                    cmbgender.SelectedValue = dr.GetString(4);
                    brithdaydate.Value = dr.GetString(5);
                    txtemail.Text = dr.GetString(6);
                    txtmobile.Text = dr.GetString(7);
                    cmbcountry.SelectedValue = dr.GetString(8);
                    cmbstate.SelectedValue = dr.GetString(9);
                    txtaddress.Text = dr.GetString(10);
                    profileimage.ImageUrl = dr.GetString(11);

                    lblname.Text = dr.GetString(3);
                    lblemail.Text = dr.GetString(6);

                }
            }
            con.Close();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            DataRetrive();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (FileUploadForImage.HasFile)
            {
                string filepath = Server.MapPath("../Admin/Images/");
                string filename = Path.GetFileName(FileUploadForImage.FileName);
                string extention = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForImage.PostedFile;
                int size = postedfile.ContentLength;
                string updatedpath = "../Admin/Images/";

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    updatedpath = updatedpath + filename;
                    FileUploadForImage.SaveAs(Server.MapPath(updatedpath));

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("update AdminTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "' , Fullname='" + txtfullname.Text + "' , Gender='" + cmbgender.SelectedItem + "' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Image='" + updatedpath + "'  where Username='" + Application["username"].ToString() + "' ", con);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        Response.Write("<script>alert('Data Updated....')</script>");
                        ((Label)Master.FindControl("lbladminname")).Text = txtusername.Text;
                        string deletepath = Server.MapPath(profileimage.ImageUrl.ToString());
                        if (File.Exists(deletepath) == true)
                        {
                            File.Delete(deletepath);
                        }
                        Application["username"] = txtusername.Text;
                        DataRetrive();

                    }
                    else
                    {
                        Response.Write("<script>alert('Data Not Updated....')</script>");
                    }
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Image File Formate')</script>");
                }

            }
            else
            {
                UpdateData();
            }
        }

        public void UpdateData()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update AdminTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "' , Fullname='" + txtfullname.Text + "' , Gender='" + cmbgender.SelectedItem + "' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Image='" + profileimage.ImageUrl.ToString() + "'  where Username='" + Application["username"].ToString() + "' ", con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data Updated....')</script>");
                ((Label)Master.FindControl("lbladminname")).Text = txtusername.Text;
                Application["username"] = txtusername.Text;
                DataRetrive();
            }
            else
            {
                Response.Write("<script>alert('Data Not Updated....')</script>");
            }
            con.Close();
        }
    }
}