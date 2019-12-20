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
    public partial class WebForm31 : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from tblapplicationno where userid='" + Session["username"] + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblUserId.Text = dr["UserId"].ToString();
                lblApplicationNo.Text = dr["ApplicationNo"].ToString();
                lblAppliedDate.Text = dr["Date_Time"].ToString();
                lblVisaStatus.Text = "Pending!";
                lblVisaStatus.CssClass = "text-danger";
            }
            else
            {
                Response.Redirect("~/personaldetails.aspx");
            }
            con.Close();
            


        }
    }
}