using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Text;

namespace WebApplication2
{
    public partial class WebForm25 : System.Web.UI.Page
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
        

        }

        private void sendIssueVisaMessage(string toEmail)
        {
            MailMessage message = new MailMessage("hemantmishra854@gmail.com", toEmail);

            StringBuilder emailBody = new StringBuilder();
            emailBody.Append("Dear User,<br /><br />");
            emailBody.Append("<p>Congratulations! Your application for visa has been verified and approved by the visa embessy of India<p>");
            emailBody.Append("<p>You will be happy to know that you will  be issued your visa within two working days from today. <p>");
            emailBody.Append("<p>Thank you very much for your kind support.<p><br />");
            emailBody.Append("<p>Regards<p>");
            emailBody.Append("<p>Hemant Mishra<p>");
            emailBody.Append("<p>Administrator,Visa Processing System<p>");
            emailBody.Append("<br /><br />");
            emailBody.Append("<b>Visa Processing System<b><br />");
            message.IsBodyHtml = true;
            message.Body = emailBody.ToString();
            message.Subject = "Visa Issued";

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "hemantmishra854@gmail.com",
                Password = "h8896820187"

            };
            client.EnableSsl = true;
            client.Send(message);

        }
    
        protected void Button1_Click(object sender, EventArgs e)
        {

         try
            {

                if (Page.IsValid)
                {
                    string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("select count(Email) as ReturnCode,Email from register where Email='"+txtEmail.Text.Trim()+"' group by Email", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        if (Convert.ToBoolean(dr["ReturnCode"]))
                        {
                            sendIssueVisaMessage(dr["Email"].ToString());
                            lblMessage.Text = "Email has been sent";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "User's email is not found!";
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
       }
}
