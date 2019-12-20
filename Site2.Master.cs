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
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            if (Session["adminname"] == null)
            {
                Response.Redirect("~/adminlogin.aspx");
            }
            lblUser.Text = "Welcome Admin ";
            lblSearchStatus.Visible = false;

        }

        
        protected void loginStatus_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/adminlogin.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spSearchUser",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email",txtUser.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.Visible = true;
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            else
            {
                lblSearchStatus.Visible = true;
                lblSearchStatus.Text = "No user found with this search pattern!";
                lblSearchStatus.CssClass="text-danger";
               
            }
           con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/getregistrationdetails.aspx");
        }

        
       
    }
}