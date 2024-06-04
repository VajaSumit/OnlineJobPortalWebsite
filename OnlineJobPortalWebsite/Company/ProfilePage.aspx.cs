using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace OnlineJobPortalWebsite.Company
{
    public partial class CompanyProfile : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

       public string img1 = "";
       public string img2 = "";
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
                ((Label)Master.FindControl("lblcompanyname")).Text = Application["username"].ToString();
            }
        }

        public void DataRetrive()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *from CompanyRegTbl where Username=@uname";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uname", Application["username"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    txtcompanyname.Text = dr.GetString(1);
                    txtcompanyWebsite.Text = dr.GetString(2);
                    txtcompanyemailid.Text = dr.GetString(3);
                    cmbcompanytype.SelectedValue = dr.GetString(4);
                    cmdcountry.SelectedValue = dr.GetString(5);
                    cmbstate.SelectedValue = dr.GetString(6);
                    txtaddress.Text = dr.GetString(7);

                    companylogo.ImageUrl = dr.GetString(8);

                    img1 = dr.GetString(9);
                    img2 = dr.GetString(10);

                    show1.HRef = img1;
                    show2.HRef = img2;

                    txtpersonename.Text = dr.GetString(11);
                    txtpersoneEmailID.Text = dr.GetString(12);
                    txtpersoneMobileNo.Text = dr.GetString(13);
                    txtusername.Text = dr.GetString(14);
                    txtpassword.Text = dr.GetString(15);

                    lblcompanyname.Text = dr.GetString(1);
                    lblcompanyemail.Text = dr.GetString(3);

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
            // update data - 1

            if (FileUploadForCompanylogo.HasFile)
            {
                string filepath = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForCompanylogo.FileName);
                string extention = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForCompanylogo.PostedFile;
                int size = postedfile.ContentLength;
                string updatedpath = "../Company/Images/";

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    updatedpath = updatedpath + filename;
                    FileUploadForCompanylogo.SaveAs(Server.MapPath(updatedpath));

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , CompanyLogo='" + updatedpath + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        //Response.Write("<script>alert('Data Updated....')</script>");
                        lblmessage.Text = "Data Updated....";
                        lblmessage.Visible = true;
                        string deletepath = Server.MapPath(companylogo.ImageUrl.ToString());
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
                        lblmessage.Text = "Data Not Updated....";
                        lblmessage.Visible = true;
                    }
                    con.Close();
                }
                else
                {
                    //Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Image File Formate')</script>");
                    lblmessage.Text = "Format Not Suppoted .. Please Select Valid Image File Formate";
                    lblmessage.Visible = true;
                }

            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , CompanyLogo='" + companylogo.ImageUrl.ToString() + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('Data Updated....')</script>");
                    lblmessage.Text = "Data Updated....";
                    lblmessage.Visible = true;

                    Application["username"] = txtusername.Text;
                    DataRetrive();
                }
                else
                {
                    //Response.Write("<script>alert('Data Not Updated....')</script>");
                    lblmessage.Text = "Data Not Updated....";
                    lblmessage.Visible = true;
                }
                con.Close();
            }



            // update data - 2

            if (FileUploadForCertificateCo.HasFile)
            {
                string filepath = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForCertificateCo.FileName);
                string extention = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForCertificateCo.PostedFile;
                int size = postedfile.ContentLength;
                string updatedpath = "../Company/Images/";

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    updatedpath = updatedpath + filename;
                    FileUploadForCertificateCo.SaveAs(Server.MapPath(updatedpath));

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , CetificateCorpporation='" + updatedpath + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        //Response.Write("<script>alert('Data Updated....')</script>");
                        lblmessage.Text = "Data Updated....";
                        lblmessage.Visible = true;

                        string deletepath = Server.MapPath(img1);
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
                        lblmessage.Text = "Data Not Updated....";
                        lblmessage.Visible = true;
                    }
                    con.Close();
                }
                else
                {
                    //Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Image File Formate')</script>");
                    lblmessage.Text = "Format Not Suppoted .. Please Select Valid Image File Formate";
                    lblmessage.Visible = true;
                }

            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , CetificateCorpporation='" + img1 + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('Data Updated....')</script>");
                    lblmessage.Text = "Data Updated....";
                    lblmessage.Visible = true;

                    Application["username"] = txtusername.Text;
                    DataRetrive();
                }
                else
                {
                    //Response.Write("<script>alert('Data Not Updated....')</script>");
                    lblmessage.Text = "Data Not Updated....";
                    lblmessage.Visible = true;
                }
                con.Close();
            }



            // update data - 3


            if (FileUploadForOrganisationPan.HasFile)
            {
                string filepath = Server.MapPath("../Company/Images/");
                string filename = Path.GetFileName(FileUploadForOrganisationPan.FileName);
                string extention = Path.GetExtension(filename);
                HttpPostedFile postedfile = FileUploadForOrganisationPan.PostedFile;
                int size = postedfile.ContentLength;
                string updatedpath = "../Company/Images/";

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    updatedpath = updatedpath + filename;
                    FileUploadForOrganisationPan.SaveAs(Server.MapPath(updatedpath));

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , OrganisationPan='" + updatedpath + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        //Response.Write("<script>alert('Data Updated....')</script>");
                        lblmessage.Text = "Data Updated....";
                        lblmessage.Visible = true;

                        string deletepath = Server.MapPath(img2);
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
                        lblmessage.Text = "Data Not Updated....";
                        lblmessage.Visible = true;
                    }
                    con.Close();
                }
                else
                {
                    //Response.Write("<script>alert('Format Not Suppoted .. Please Select Valid Image File Formate')</script>");
                    lblmessage.Text = "Format Not Suppoted .. Please Select Valid Image File Formate";
                    lblmessage.Visible = true;
                 }

            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("update CompanyRegTbl set CompanyName='" + txtcompanyname.Text + "' , CompanyWebsite='" + txtcompanyWebsite.Text + "' ,CompanyEmailId='" + txtcompanyemailid.Text + "' , CompanyType='" + cmbcompanytype.SelectedItem + "' , Country='" + cmdcountry.SelectedItem + "' , State='" + cmbstate.SelectedItem + "' , Address='" + txtaddress.Text + "' , OrganisationPan='" + img2 + "' , PersoneName='" + txtpersonename.Text + "' , PersoneEmail='" + txtpersoneEmailID.Text + "' , PersoneMobile='" + txtpersoneMobileNo.Text + "' , Username='" + txtusername.Text + "' , Password='" + txtpassword.Text + "'  where Username='" + Application["username"].ToString() + "' ", con);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('Data Updated....')</script>");
                    lblmessage.Text = "Data Updated....";
                    lblmessage.Visible = true;

                    Application["username"] = txtusername.Text;
                    DataRetrive();
                }
                else
                {
                    //Response.Write("<script>alert('Data Not Updated....')</script>");
                    lblmessage.Text = "Data Not Updated....";
                    lblmessage.Visible = true;
                }
                con.Close();
            }

        }

       
    }
}