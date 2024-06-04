using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace OnlineJobPortalWebsite.User
{
    public partial class RegistrationPageForJS : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string q = "select *from RegistrationForJSTbl where Username=@name";
            SqlCommand c = new SqlCommand(q, conn);
            c.Parameters.AddWithValue("@name", txtusername.Text);
            conn.Open();
            SqlDataReader dr = c.ExecuteReader();
            if (dr.HasRows)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Already Exist The Username, Please Enter The Unique Username........')</script>");
                conn.Close();

            }
            else
            {
                string img1path = fileuploadforimage();
                string img2path = fileuploadforresume();
                if (img1path == " ")
                {
                    lblresult.Text = "Not Valid The Image Extension , Select : jpg/png/jpeg file....";
                    lblresult.Visible = true;
                }
                else if (img2path == " ")
                {
                    lblresult.Text = "Not Valid The Resume Extension.......Select : Only PDF file....";
                    lblresult.Visible = true;
                }
                else
                {
                    SqlConnection con = new SqlConnection(cs);
                    string query = "insert into RegistrationForJSTbl values(@username,@pass,@name,@gender,@dob,@email,@mobile,@country,@state,@address,@image,@skill,@aboutme,@resume)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", txtusername.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpassword.Text);
                    cmd.Parameters.AddWithValue("@name", txtfullname.Text);
                    cmd.Parameters.AddWithValue("@gender", cmbgender.SelectedValue);
                    cmd.Parameters.AddWithValue("@dob", brithdaydate.Value);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                    cmd.Parameters.AddWithValue("@country", cmbcountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@state", cmbstate.SelectedValue);
                    cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@image", img1path);
                    cmd.Parameters.AddWithValue("@skill", txtskill.Text);
                    cmd.Parameters.AddWithValue("@aboutme", txtaboutme.Text);
                    cmd.Parameters.AddWithValue("@resume", img2path);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        lblresult.Text = "Your Registration Success......";
                        lblresult.Visible = true;
                        lblresult.ForeColor = System.Drawing.Color.Green;
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Your Registration Success..........')</script>");
                        clearData();
                        //Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        //Response.Write("<script>alert('Your Registration Faild....')</script>");

                        lblresult.Text = "Your Registration Faild......";
                        lblresult.Visible = true;
                        lblresult.ForeColor = System.Drawing.Color.Red;

                    }
                    con.Close();
                }

            }

        }



        public void clearData()
        {
            txtusername.Text = string.Empty;
            txtpassword.Text = string.Empty;
            txtconfirmpassword.Text = string.Empty;
            txtfullname.Text = string.Empty;
            cmbgender.SelectedValue = "Select Gender";
            brithdaydate.Value = "mm/dd/yyyy";
            txtemail.Text = string.Empty;
            txtmobile.Text = string.Empty;
            cmbcountry.SelectedValue = "Select Country";
            cmbstate.SelectedValue = "Select State";
            txtaddress.Text = string.Empty;
            txtskill.Text = string.Empty;
            txtaboutme.Text = string.Empty;

        }


        public string fileuploadforresume()
        {
            string img_path = " ";
            if (FileUploadForResume.HasFile)
            {
                string path = Server.MapPath("../JobSeeker/Resumes/");
                string filename = Path.GetFileName(FileUploadForResume.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForResume.PostedFile;
                int size = postedfile.ContentLength;

                if (extension.ToUpper() == ".PDF")
                {
                    FileUploadForResume.SaveAs(path + filename);
                    img_path = "../JobSeeker/Resumes/" + filename;
                    return img_path;

                }
                else
                {

                    lblresult.Text = "Not Valid The Extension.......Select : Only PDF file....";
                    lblresult.Visible = true;
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Not Valid The Extension.......Select : Only PDF file....')</script>");
                }
            }
            return img_path;
        }

        public string fileuploadforimage()
        {
            string img_path = " ";
            if (FileUploadForImage.HasFile)
            {
                string path = Server.MapPath("../JobSeeker/Images/");
                string filename = Path.GetFileName(FileUploadForImage.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForImage.PostedFile;
                int size = postedfile.ContentLength;

                if (extension.ToUpper() == ".JPG" || extension.ToUpper() == ".PNG" || extension.ToUpper() == ".JPEG")
                {
                    FileUploadForImage.SaveAs(path + filename);
                    img_path = "../JobSeeker/Images/" + filename;
                    return img_path;

                }
                else
                {
                    lblresult.Text = "Not Valid The Image Extension , Select : jpg/png/jpeg file....";
                    lblresult.Visible = true;

                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Not Valid The Image Extension , Select : jpg/png/jpeg file....')</script>");
                }
            }
            return img_path;
        }

    }
}