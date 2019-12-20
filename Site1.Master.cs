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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 

            if (Session["username"] != null)
            {
                navbarDropdown.Visible = true;
                hypVisaStatus.Visible = true;
                hypProfile.Visible = true;
                hypProfile.NavigateUrl = "~/profile.aspx";
                hypVisaStatus.NavigateUrl = "~/visastatus.aspx";
                loginStatus.Text = "logout";
                loginStatus.CssClass = "btn btn-danger";
                string strcon = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string useremail = Session["username"].ToString();
                SqlCommand cmd = new SqlCommand("select name from register where email='" + useremail + "'", con);
                string user = cmd.ExecuteScalar().ToString();
                con.Close();
                lblUser.Text ="Welcome "+ user;
                lblUser.CssClass = "  ml-0 ml-lg-5 mr-lg-2 text-success";
            }
            else
            {

                lblUser.Text = "Welcome visitor!" ;
                lblUser.CssClass = "  ml-0 ml-lg-5 mr-lg-2 text-white";
                loginStatus.Text = "Login/Register";
                loginStatus.PostBackUrl = "~/login.aspx";
                loginStatus.CssClass = "btn btn-primary";
            }
        }


        protected void loginStatus_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Response.Redirect("~/index.aspx");

        }

        

        
        

    }
}