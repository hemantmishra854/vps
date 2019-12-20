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

namespace WebApplication2
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 
            if (Session["username"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("select applicationno from tblapplicationno where userid='"+Session["username"]+"'", con);
            con.Open();
           SqlDataReader dr= cmd.ExecuteReader();
           if (dr.Read())
           {
               lblApplication.Text = dr["ApplicationNo"].ToString();
           }
           else
           {
               Response.Redirect("~/personaldetails.aspx");
           }
           con.Close();
            


        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload3.HasFile)
            {


                HttpCookie cookieDocuments = new HttpCookie("documentsdetails");
                HttpPostedFile postedfilePhoto = FileUpload1.PostedFile;
                string filenamePhoto = Path.GetFileName(postedfilePhoto.FileName);
                string fileExtensionPhoto = Path.GetExtension(filenamePhoto);
                int filesizePhoto = postedfilePhoto.ContentLength;
                if (fileExtensionPhoto.ToLower() == ".jpg" || fileExtensionPhoto.ToLower() == ".png" ||
                fileExtensionPhoto.ToLower() == ".bmp" || fileExtensionPhoto.ToLower() == ".gif")
                {
                    if (filesizePhoto < 2097152)
                    {
                        Stream stream = postedfilePhoto.InputStream;
                        BinaryReader reader = new BinaryReader(stream);
                        byte[] bytes = reader.ReadBytes((int)stream.Length);
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                        SqlCommand cmd = new SqlCommand("spPhoto", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", filenamePhoto);
                        cmd.Parameters.AddWithValue("@Size", filesizePhoto);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@UserId", Session["username"].ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }

                HttpPostedFile postedfilePassport = FileUpload2.PostedFile;
                string filenamePassport = Path.GetFileName(postedfilePassport.FileName);
                string fileExtensionPassport = Path.GetExtension(filenamePassport);
                int filesizePassport = postedfilePassport.ContentLength;
                if (fileExtensionPassport.ToLower() == ".jpg" || fileExtensionPassport.ToLower() == ".png" ||
                fileExtensionPassport.ToLower() == ".bmp" || fileExtensionPassport.ToLower() == ".gif")
                {
                    if (filesizePassport < 2097152)
                    {

                        Stream stream = postedfilePassport.InputStream;
                        BinaryReader reader = new BinaryReader(stream);
                        byte[] bytes = reader.ReadBytes((int)stream.Length);
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                        SqlCommand cmd = new SqlCommand("spPassport", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", filenamePassport);
                        cmd.Parameters.AddWithValue("@Size", filesizePassport);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@UserId", Session["username"].ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }
                }

                HttpPostedFile postedfileAadhar = FileUpload3.PostedFile;
                string filenameAadhar = Path.GetFileName(postedfileAadhar.FileName);
                string fileExtensionAadhar = Path.GetExtension(filenameAadhar);
                int filesizeAadhar = postedfileAadhar.ContentLength;
                if (fileExtensionAadhar.ToLower() == ".jpg" || fileExtensionAadhar.ToLower() == ".png" ||
                fileExtensionAadhar.ToLower() == ".bmp" || fileExtensionAadhar.ToLower() == ".gif")
                {
                    if (filesizeAadhar < 2097152)
                    {
                        Stream stream = postedfileAadhar.InputStream;
                        BinaryReader reader = new BinaryReader(stream);
                        byte[] bytes = reader.ReadBytes((int)stream.Length);
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                        SqlCommand cmd = new SqlCommand("spAadharCard", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", filenameAadhar);
                        cmd.Parameters.AddWithValue("@Size", filesizeAadhar);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@UserId", Session["username"].ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                    }

                }


                Response.Write("<script>confirm(return 'All the documents uploaded successfully')</script>");
                Response.Redirect("~/welcome.aspx");

            }
            else
            {
                Response.Write("<script>alert('Please Upload all the documents')</script>");

            }


      }
            

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload3.HasFile)
            {


                HttpCookie cookieDocuments = new HttpCookie("documentsdetails");
                HttpPostedFile postedfilePhoto = FileUpload1.PostedFile;
                string filenamePhoto = Path.GetFileName(postedfilePhoto.FileName);
                string fileExtensionPhoto = Path.GetExtension(filenamePhoto);
                int filesizePhoto = postedfilePhoto.ContentLength;
                if (fileExtensionPhoto.ToLower() == ".jpg" || fileExtensionPhoto.ToLower() == ".png" ||
                fileExtensionPhoto.ToLower() == ".bmp" || fileExtensionPhoto.ToLower() == ".gif")
                {
                    if (filesizePhoto < 2097152)
                    {

                        FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));

                        cookieDocuments["Photo"] = filenamePhoto;
                    }
                    }

                HttpPostedFile postedfilePassport = FileUpload2.PostedFile;
                string filenamePassport = Path.GetFileName(postedfilePassport.FileName);
                string fileExtensionPassport = Path.GetExtension(filenamePassport);
                int filesizePassport = postedfilePassport.ContentLength;
                if (fileExtensionPassport.ToLower() == ".jpg" || fileExtensionPassport.ToLower() == ".png" ||
                fileExtensionPassport.ToLower() == ".bmp" || fileExtensionPassport.ToLower() == ".gif")
                {
                    if (filesizePassport < 2097152)
                    {

                        FileUpload2.SaveAs(Server.MapPath("~/Uploads/" + FileUpload2.FileName));

                        cookieDocuments["Passport"] = filenamePassport;
                    }
                    }

                HttpPostedFile postedfileAadhar = FileUpload3.PostedFile;
                string filenameAadhar = Path.GetFileName(postedfileAadhar.FileName);
                string fileExtensionAadhar = Path.GetExtension(filenameAadhar);
                int filesizeAadhar = postedfileAadhar.ContentLength;
                if (fileExtensionAadhar.ToLower() == ".jpg" || fileExtensionAadhar.ToLower() == ".png" ||
                fileExtensionAadhar.ToLower() == ".bmp" || fileExtensionAadhar.ToLower() == ".gif")
                {
                    if (filesizeAadhar < 2097152)
                    {

                        FileUpload3.SaveAs(Server.MapPath("~/Uploads/" + FileUpload3.FileName));

                        cookieDocuments["Aadhar"] = filenameAadhar;



                    }
                    }

                Response.Write("<script>confirm(return 'All the documents uploaded successfully')</script>");
                Response.Cookies.Add(cookieDocuments);
                Response.Redirect("~/documents.aspx");


            }
            else
            {
                Response.Write("<script>alert('Please Upload all the documents')</script>");

            }



        }

   }
}
