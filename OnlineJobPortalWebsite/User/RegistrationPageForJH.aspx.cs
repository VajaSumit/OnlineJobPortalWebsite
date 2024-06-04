using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace OnlineJobPortalWebsite.User
{
    public partial class RegistrationPageForJH : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string fileuploadimageforcompanylogo()
        {
            string img_path = "";
            if (FileUploadForCompanylogo.HasFile)
            {
                string path = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForCompanylogo.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForCompanylogo.PostedFile;
                int size = postedfile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".ico")
                {
                    FileUploadForCompanylogo.SaveAs(path + filename);
                    img_path = "../Company/Images/" + filename;
                    return img_path;

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Not Valid The Image Extension.......Select : jpg or png or jpeg or icon file....')</script>");
                }
            }
            return img_path;
        }

        public string fileuploadimageforcertificate()
        {
            string img_path = "";
            if (FileUploadForCertificateCo.HasFile)
            {
                string path = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForCertificateCo.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForCertificateCo.PostedFile;
                int size = postedfile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".pdf")
                {
                    FileUploadForCertificateCo.SaveAs(path + filename);
                    img_path = "../Company/Images/" + filename;
                    return img_path;

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Not Valid The File Extension.....Select : jpg or png or jpeg or pdf file')</script>");
                }
            }
            return img_path;
        }

        public string fileuploadimageforOrganisationpan()
        {
            string img_path = "";
            if (FileUploadForOrganisationPan.HasFile)
            {
                string path = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForOrganisationPan.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForOrganisationPan.PostedFile;
                int size = postedfile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".pdf")
                {
                    FileUploadForOrganisationPan.SaveAs(path + filename);
                    img_path = "../Company/Images/" + filename;
                    return img_path;

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Not Valid The File Extension.....Select : jpg or png or jpeg or pdf file')</script>");
                }
            }
            return img_path;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            string q1 = "select *from CompanyRegTbl where Username=@uname or CompanyName=@cname or CompanyWebsite=@cwebsite";
            SqlCommand c1 = new SqlCommand(q1, conn);
            c1.Parameters.AddWithValue("@uname", txtusername.Text);
            c1.Parameters.AddWithValue("@cname", txtcompanyname.Text);
            c1.Parameters.AddWithValue("@cwebsite", txtcompanyWebsite.Text);
            SqlDataReader dr1 = c1.ExecuteReader();
            if (dr1.HasRows)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Already Exist The Username/Company-Name/Company-Website, Please Enter The Unique Username........')</script>");
            }
            else
            {
                Registration();
            }
            conn.Close();

        }


        public void Registration()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into CompanyRegTbl values(@cname,@cwebsite,@cemail,@ctype,@country,@state,@address,@clogo,@cetificate,@organisationpan,@pname,@pemail,@pmobile,@username,@password)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@cname", txtcompanyname.Text);
            cmd.Parameters.AddWithValue("@cwebsite", txtcompanyWebsite.Text);
            cmd.Parameters.AddWithValue("@cemail", txtcompanyemailid.Text);
            cmd.Parameters.AddWithValue("@ctype", cmbcompanytype.SelectedValue);
            cmd.Parameters.AddWithValue("@country", cmdcountry.SelectedValue);
            cmd.Parameters.AddWithValue("@state", cmbstate.SelectedValue);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@clogo", fileuploadimageforcompanylogo());
            cmd.Parameters.AddWithValue("@cetificate", fileuploadimageforcertificate());
            cmd.Parameters.AddWithValue("@organisationpan", fileuploadimageforOrganisationpan());
            cmd.Parameters.AddWithValue("@pname", txtpersonename.Text);
            cmd.Parameters.AddWithValue("@pemail", txtpersoneEmailID.Text);
            cmd.Parameters.AddWithValue("@pmobile", txtpersoneMobileNo.Text);
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Registration Successfuly...')</script>");
                Response.Redirect("../User/Default.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Registration Faild...')</script>");
            }
            con.Close();
        }


    }
}