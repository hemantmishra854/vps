using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace WebApplication2
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 
            if (Session["adminname"] != null)
            {
                Response.Redirect("~/admin.aspx");
            }
        }
        private bool AuthenticateUser(string email, string password)
        {
            string strcon = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("[dbo].[spAdminLogin]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email",email);
            cmd.Parameters.AddWithValue("@password",password);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return id == 1;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(txtEmail.Text.Trim(), txtPassword.Text.Trim()))
            {
                Session["adminname"] = txtEmail.Text.Trim();
                Response.Redirect("~/admin.aspx");
            }
            else
            {

                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Invalid User Name Or Password!";

            }
        }
    

    }
}