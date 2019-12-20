using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WebApplication2
{
    public partial class WebForm32 : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlDataAdapter da = new SqlDataAdapter("[dbo].[spGetPhotoById]", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@id", Session["username"].ToString());
                DataSet ds = new DataSet();
                da.Fill(ds, "Photo");

                if (ds.Tables["Photo"].Rows.Count > 0)
                {
                    DataRow row = ds.Tables["Photo"].Rows[0];
                    byte[] bytes = (byte[])row["Data"];
                    string urlBase64 = Convert.ToBase64String(bytes);
                    imgPhoto.ImageUrl = "data:Image/png;base64," + urlBase64;

                }
                else
                {

                    lblStatus.Text = "Upload your photo";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }

                da = new SqlDataAdapter("[dbo].[spGetProfileById]", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@Id", Session["username"].ToString());
                ds = new DataSet();
                da.Fill(ds, "User");
                ViewState["SQL_Querey"] = "[dbo].[spGetProfileById]";
                ViewState["Dataset"] = ds;

                if (ds.Tables["User"].Rows.Count > 0)
                {
                    DataRow row = ds.Tables["User"].Rows[0];
                    txtName.Text = row["Name"].ToString();
                    txtEmail.Text = row["Email"].ToString();
                    txtDOB.Text = row["DOB"].ToString();
                    txtContact.Text = row["ContactNo"].ToString();
                    txtGender.Text = row["Gender"].ToString();
                }
                lblChangeProfileMessage.Text = "";
                lblStatus.Text = "";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("[dbo].[spChangeProfile]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Gender", txtGender.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@ContactNo", txtContact.Text);
            con.Open();
            cmd.ExecuteNonQuery();

            lblChangeProfileMessage.Text = "Profile changed successfully.";
            lblChangeProfileMessage.CssClass = "text-success";
            if (FileUpload1.HasFile)
            {
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
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                        cmd = new SqlCommand("spPhoto", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", filenamePhoto);
                        cmd.Parameters.AddWithValue("@Size", filesizePhoto);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@UserId", Session["username"].ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        lblStatus.Text = "file exceeds maximum file length(2 mb)";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        lblChangeProfileMessage.Text = "";
                    }
                }
                else
                {
                    lblStatus.Text = "Please upload only .jpg,.png,.bmp or .gif files";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblChangeProfileMessage.Text = "";
                }

            }
            cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("[dbo].[spGetPhotoById]", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@id", Session["username"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds, "Photo");

            if (ds.Tables["Photo"].Rows.Count > 0)
            {
                DataRow row = ds.Tables["Photo"].Rows[0];
                byte[] bytes = (byte[])row["Data"];
                string urlBase64 = Convert.ToBase64String(bytes);
                imgPhoto.ImageUrl = "data:Image/png;base64," + urlBase64;

            }

            con.Close();
       
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/profile.aspx");
        }
    }
}