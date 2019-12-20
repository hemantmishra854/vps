using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration ;


namespace WebApplication2
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    HttpContext.Current.Response.Cache.SetNoServerCaching();
        //    HttpContext.Current.Response.Cache.SetNoStore();
        //    if (Session["username"] == null)
        //    {
        //        Response.Redirect("~/login.aspx");
        //    }
            if (!IsPostBack)
            {
                txtVisaCategory.DataSource = getData("spGetVisaCategory", null);
                txtVisaCategory.DataBind();

                ListItem liCategory = new ListItem("--Select Visa Category--","-1");
                txtVisaCategory.Items.Insert(0,liCategory);

            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                        Response.Write("<script>alert('Data Saved Successfully')</script>");

                        HttpCookie cookiePassport = new HttpCookie("passportdetails");
                        cookiePassport["PassportNo"] = txtPassport.Text.Trim();
                        cookiePassport["VisaDate"] = txtIssueDate.Text.Trim();
                        cookiePassport["Duration"] = txtExpiryDate.Text.Trim();
                        cookiePassport["Destination"] = txtIssuePlace.Text.Trim();
                        cookiePassport["VisaType"] = txtVisaType.SelectedItem.Text.Trim();
                        cookiePassport["VisaCategory"] = txtVisaCategory.SelectedItem.Text.Trim();

                        Response.Cookies.Add(cookiePassport);
                        Response.Redirect("~/confirm.aspx");

                    }
                    
                    else
                    {
                        Response.Write("<script>alert('Something went wrong!')</script>");

                    }

                
            }

        private DataSet getData(string spName, SqlParameter spParameter)
        {
            string strcon = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter da = new SqlDataAdapter(spName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (spParameter != null)
            {
                da.SelectCommand.Parameters.Add(spParameter);
            }
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;

        }

        protected void txtVisaCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtVisaCategory.SelectedIndex == 0)
            {
                txtVisaType.SelectedIndex = 0;
                txtVisaType.Enabled = false;
            }
            else
            {
                txtVisaType.Enabled = true;
                SqlParameter parameter = new SqlParameter("@CategoryId",txtVisaCategory.SelectedValue);
                txtVisaType.DataSource = getData("spGetVisaType",parameter);
                txtVisaType.DataBind();

                ListItem liType = new ListItem("--Select Visa Type--", "-1");
                txtVisaType.Items.Insert(0, liType);


            }

        }
    
        
    }
}