using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace OnlineJobPortalWebsite.JobSeeker
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        string img1 = " ";
        string img2 = " ";
        
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
                ((Label)Master.FindControl("mylable")).Text = Application["username"].ToString();
            }


        }

        public void DataRetrive()
        {
            //int id = Convert.ToInt32(Session["id"]);
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from RegistrationForJSTbl where Username=@uname";
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

                    img1 = dr.GetString(11);
                    profileimage.ImageUrl = img1;

                    txtskill.Text = dr.GetString(12);
                    txtaboutme.Text = dr.GetString(13);

                    img2 = dr.GetString(14);
                    ViewResume.HRef = img2;

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
                UpdateTheProfileImage();
            }
            else
            {
                UpdateData1();
            }

            if (FileUploadForResume.HasFile)
            {
                UpdateTheProfileResume();
            }
            else
            {
                UpdateData2();
            }

        }
        public void UpdateData1()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update RegistrationForJSTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text +"' , Name='" + txtfullname.Text +"' , Gender='" + cmbgender.SelectedItem +"' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Image='" + profileimage.ImageUrl.ToString() + "' , Skill='" + txtskill.Text + "' , AboutMe='" + txtaboutme.Text + "'   where Username='" + Application["username"].ToString() + "' ", con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                //Response.Write("<script>alert('Data Updated....')</script>");
                lblmsg.Text = "Profile Updated...";
                lblmsg.Visible = true;
                Application["username"] = txtusername.Text;
                DataRetrive();
            }
            else
            {
                //Response.Write("<script>alert('Data Not Updated....')</script>");
                lblmsg.Text = "Profile Not Updated...";
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }
            con.Close();
        }

        public void UpdateData2()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update RegistrationForJSTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "' , Name='" + txtfullname.Text + "' , Gender='" + cmbgender.SelectedItem + "' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Skill='" + txtskill.Text + "' , AboutMe='" + txtaboutme.Text + "' , Resume='" + img2 + "'   where Username='" + Application["username"].ToString() + "' ", con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                //Response.Write("<script>alert('Data Updated....')</script>");
                lblmsg.Text = "Profile Updated...";
                lblmsg.Visible = true;
                Application["username"] = txtusername.Text;
                DataRetrive();
            }
            else
            {
                //Response.Write("<script>alert('Data Not Updated....')</script>");
                lblmsg.Text = "Profile Not Updated...";
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }


        public void UpdateTheProfileImage()
        {
            string filepath = Server.MapPath("../JobSeeker/Images/");
            string filename = Path.GetFileName(FileUploadForImage.FileName);
            string extention = Path.GetExtension(filename);
            HttpPostedFile postedfile = FileUploadForImage.PostedFile;
            int size = postedfile.ContentLength;
            string updatedpath = "../JobSeeker/Images/";

            if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
            {
                updatedpath = updatedpath + filename;
                FileUploadForImage.SaveAs(Server.MapPath(updatedpath));

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("update RegistrationForJSTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "' , Name='" + txtfullname.Text + "' , Gender='" + cmbgender.SelectedItem + "' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Image='" + updatedpath + "' , Skill='" + txtskill.Text + "' , AboutMe='" + txtaboutme.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    lblmsg.Text = "Profile Updated...";
                    lblmsg.Visible = true;
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
                    //Response.Write("<script>alert('Data Not Updated....')</script>");
                    lblmsg.Text = "Profile Not Updated...";
                    lblmsg.Visible = true;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
            }
            else
            {
                //Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Image File Formate')</script>");
                lblmsg.Text = "Format Not Suppoted .. Please Select Valid Image File Formate";
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void UpdateTheProfileResume()
        {
            string filepath = Server.MapPath("../JobSeeker/Resumes/");
            string filename = Path.GetFileName(FileUploadForResume.FileName);
            string extention = Path.GetExtension(filename);
            HttpPostedFile postedfile = FileUploadForResume.PostedFile;
            int size = postedfile.ContentLength;
            string updatedpath = "../JobSeeker/Resumes/";

            if (extention.ToLower() == ".pdf")
            {
                updatedpath = updatedpath + filename;
                FileUploadForResume.SaveAs(Server.MapPath(updatedpath));

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("update RegistrationForJSTbl set Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "' , Name='" + txtfullname.Text + "' , Gender='" + cmbgender.SelectedItem + "' , Brithday='" + brithdaydate.Value + "' , Email='" + txtemail.Text + "' , Mobile='" + txtmobile.Text + "' , Country='" + cmbcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , Skill='" + txtskill.Text + "' , AboutMe='" + txtaboutme.Text + "' , Resume='" + updatedpath + "'  where Username='" + Application["username"].ToString() + "' ", con);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    lblmsg.Text = "Profile Updated...";
                    lblmsg.Visible = true;

                    string deletepath = Server.MapPath(img2.ToString());
                    if (File.Exists(deletepath) == true)
                    {
                        File.Delete(deletepath);
                    }
                    Application["username"] = txtusername.Text;
                    DataRetrive();

                }
                else
                {
                    //Response.Write("<script>alert('Data Not Updated....')</script>");
                    lblmsg.Text = "Profile Not Updated...";
                    lblmsg.Visible = true;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
            }
            else
            {
                //Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Resume File Formate(Only PDF)')</script>");
                lblmsg.Text = "Format Not Suppoted .. Please Select Valid Resume File Formate(Only PDF)";
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}