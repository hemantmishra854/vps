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
    public partial class WebForm21 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            if (Session["adminlogin"] != null)
            {
                Response.Redirect("~/adminlogin.aspx");
            }

            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("select Name,Email,FathersName,DOB,Gender,ContactNo from register r join personaldetails p on r.email=p.userid", con);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
            

        }
    }
}