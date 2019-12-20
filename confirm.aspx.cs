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
    public partial class WebForm40 : System.Web.UI.Page
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
            if (!IsPostBack)
            {

                HttpCookie cookie = Request.Cookies["userdetails"];
                txtFather.Text = cookie["FName"];
                txtMother.Text = cookie["MName"];
                txtDOB.Text = cookie["DOB"];
                txtContact.Text = cookie["Contact"];
                txtGender.Text = cookie["Gender"];
                txtDegree.Text = cookie["Degree"];
                txtStatus.Text = cookie["Status"];
                txtStreet.Text = cookie["Street"];
                txtCity.Text = cookie["City"];
                txtState.Text = cookie["State"];
                txtCountry.Text = cookie["Country"];
                txtZip.Text = cookie["Zip"];

                HttpCookie cookiepass = Request.Cookies["passportdetails"];
                txtPassportNo.Text = cookiepass["PassportNo"];
                txtVisaDate.Text = cookiepass["VisaDate"];
                txtDuration.Text = cookiepass["Duration"];
                txtDestination.Text = cookiepass["Destination"];
                txtVisaType.Text = cookiepass["VisaType"];
                txtVisaCategory.Text = cookiepass["VisaCategory"];

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("[dbo].[spPersonaldetails]", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Fathersname",txtFather.Text);
            cmd.Parameters.AddWithValue("@Mothersname",txtMother.Text);
            cmd.Parameters.AddWithValue("@DOB",txtDOB.Text);
            cmd.Parameters.AddWithValue("@ContactNo",txtContact.Text);
            cmd.Parameters.AddWithValue("@Gender",txtGender.Text);
            cmd.Parameters.AddWithValue("@MarritulStatus",txtStatus.Text);
            cmd.Parameters.AddWithValue("@Street",txtStreet.Text);
            cmd.Parameters.AddWithValue("@City",txtCity.Text);
            cmd.Parameters.AddWithValue("@State",txtState.Text);
            cmd.Parameters.AddWithValue("@Country",txtCountry.Text);
            cmd.Parameters.AddWithValue("@ZipCode",txtZip.Text);
            string user = Session["username"].ToString();
            cmd.Parameters.AddWithValue("@UserId",user);
            int code = (int)cmd.ExecuteScalar();
            cmd = new SqlCommand("[dbo].[spPassportDetails]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PassportNo",txtPassportNo.Text);
            cmd.Parameters.AddWithValue("@VisaDate",txtVisaDate.Text);
            cmd.Parameters.AddWithValue("@Duration", txtDuration.Text);
            cmd.Parameters.AddWithValue("@DestinationCountry", txtDestination.Text);
            cmd.Parameters.AddWithValue("@VisaType", txtVisaType.Text);
            cmd.Parameters.AddWithValue("@VisaCategory", txtVisaCategory.Text);
            cmd.Parameters.AddWithValue("@UserId", user);
            int rcode = (int)cmd.ExecuteScalar();

            if (rcode == 1 && code == 1)
            {
                cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                con = new SqlConnection(cs);
                cmd = new SqlCommand("[dbo].[spApplicationNo]", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId",user);
                cmd.ExecuteScalar();
                Response.Write("<script>confirm('return Data Saved Successfully')</script>");
                Response.Redirect("~/uploaddocuments.aspx");

            }
            else
            {

                Response.Write("<script>alert('Data  already exists!')</script>");
            }
        }
        
    }
}