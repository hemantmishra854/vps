using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
        

namespace WebApplication2
{
    public partial class WebForm43 : System.Web.UI.Page
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
                lblName.Text = row["Name"].ToString();
                lblEmail.Text = row["Email"].ToString();
                lblDate.Text = row["DOB"].ToString();
                lblContact.Text = row["ContactNo"].ToString();
                lblGender.Text = row["Gender"].ToString();
            }
            else
            {
                Response.Redirect("~/personaldetails.aspx");
            }

            
            con.Close();
            
            
         }
    }
}