using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web;

namespace WebApplication2
{
    public partial class WebForm23 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 

            if (Session["username"] != null)
            {
                Response.Redirect("~/welcome.aspx");

            }
            
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("[dbo].[spRegister]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                string encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "SHA1");
                cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@password", encryptedpass);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                string msg = string.Empty;
                switch (id)

                {
                    case -1: msg = "Email Address Already Exists! ";
                        break;
                    default: msg = "You Have Successfully Registered";

                        Response.Redirect("~/login.aspx");

                        break;
                }
               
           
                Response.Write("<script>alert('" + msg + "')</script>");
              
            }

        }
    }
}