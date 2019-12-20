using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication2
{
    public partial class WebForm35 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 
            if(Session["username"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                    lblMessage.Text = "Data saved temporarily";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    HttpCookie cookie = new HttpCookie("userdetails");
                    cookie["FName"] = txtFather.Text.Trim();
                    cookie["MName"] = txtMother.Text.Trim();
                    cookie["DOB"] =   txtDOB.Text.Trim();
                    cookie["Contact"] = txtContact.Text.Trim();
                    if (rdoMale.Checked)
                    {
                        cookie["Gender"] = rdoMale.Text.Trim();
                    }
                    else
                    {

                        cookie["Gender"] = rdoFemale.Text.Trim();
                    }
                    cookie["Degree"] = txtDegree.SelectedItem.Text.Trim();
                    cookie["Status"] = txtStatus.SelectedItem.Text.Trim();
                    cookie["Street"]=txtStreet.Text.Trim();
                    cookie["City"]=txtCity.Text.Trim();
                    cookie["State"]=txtState.Text.Trim();
                    cookie["Country"]=txtCountry.Text.Trim();
                    cookie["Zip"]=txtZip.Text.Trim();
                    Response.Cookies.Add(cookie);
                    Response.Redirect("~/passportdetails.aspx");
                }
        }

       }
}