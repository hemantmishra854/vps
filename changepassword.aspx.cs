using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace WebApplication2
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 
            if(!IsPostBack)
            {
                if(!IsValidResetPasswordLink())
                {
                 lblMessage.Text="Password reset link has expired or is invalid";
                  lblMessage.ForeColor=System.Drawing.Color.Red;
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (ChangePassword())
            {
                lblMessage.Text = "Password changed successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {

                lblMessage.Text = "Password reset link has expired or is invalid.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        private bool ChangePassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
            new SqlParameter()
            {
               ParameterName="@GUID",
               Value=Request.QueryString["uid"]
              
            },
            new SqlParameter()
            {
               ParameterName="@Password",
               Value=FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text.Trim(),"SHA1")
              
            }
            
            };
            return ExecuteSp("spChangePassword", paramList);
        }
       

        private bool IsValidResetPasswordLink()
        {
            List<SqlParameter> paramList=new List<SqlParameter>()
            {
            new SqlParameter()
            {
               ParameterName="@GUID",
               Value=Request.QueryString["uid"]
              
            }
            };
            return ExecuteSp("spIsValidResetPasswordLink",paramList);
        }
        private bool ExecuteSp( string spName,List<SqlParameter> spParameters)
        {
             
                string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                 foreach(SqlParameter param in spParameters)
                 {
                cmd.Parameters.Add(param);
                 }
           
            con.Open();

           return Convert.ToBoolean(cmd.ExecuteScalar());
            
        }
        }
    }
