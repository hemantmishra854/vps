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
using System.Net.Mail;
using System.Text;
namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (Page.IsValid)
                {
                    string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("spResetPassword", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", txtEmail.Text.Trim());
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        if (Convert.ToBoolean(dr["ReturnCode"]))
                        {
                            sendPasswordResetLink(dr["Email"].ToString(), dr["UniqueId"].ToString());
                            lblMessage.Text = "An email has been sent to your registered email-id to reset your password";
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "your email is not found!";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Check your Internet connection or network settings";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        
        }
        private void sendPasswordResetLink(string toEmail,string uniqueId)
        {
            MailMessage message=new MailMessage("hemantmishra854@gmail.com",toEmail);

            StringBuilder emailBody = new StringBuilder();
            emailBody.Append("Dear User,<br /><br />");
            emailBody.Append("please click the following link to reset your password<br />");
            emailBody.Append("https://localhost/WebApplication2/changepassword.aspx?uid="+uniqueId);
            emailBody.Append("<br /><br />");
            emailBody.Append("<b>Visa Processing System<b><br />");

            message.IsBodyHtml = true;
            message.Body = emailBody.ToString();
            message.Subject = "Reset Your Password";

            SmtpClient client = new SmtpClient("smtp.gmail.com",587);
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "hemantmishra854@gmail.com",
                Password = "h8896820187"

            };
            client.EnableSsl = true;
            client.Send(message);
            
        }
    }
}