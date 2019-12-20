using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
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
        private bool AuthenticateUser(string email, string password)
        {
                string strcon = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("[dbo].[spLogin]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                string encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@password", encryptedpass);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                return id == 1;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(txtEmail.Text, txtPassword.Text))
            {

                Session["username"] = txtEmail.Text.Trim();
                //if (CheckBox1.Checked)
                //{
                //    ViewState["useremail"] = txtEmail.Text;
                //    ViewState["userepassword"] = txtPassword.Text;

                //}
                Response.Redirect("~/welcome.aspx");
            }
            else
            {

                 Label1.ForeColor = System.Drawing.Color.Red;
                 Label1.Text = "Invalid User Name Or Password!";
               
            }
        }
    }
}