using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm42 : System.Web.UI.Page
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

            HttpCookie cookiedoc = Request.Cookies["documentsdetails"];
            imgPhoto.ImageUrl = "~/Uploads/" + cookiedoc["Photo"];
            imgPassport.ImageUrl = "~/Uploads/" + cookiedoc["Passport"];
            imgAadhar.ImageUrl = "~/Uploads/" + cookiedoc["Aadhar"];

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

        }
    }
}