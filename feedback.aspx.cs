using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Web;


namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore(); 
            if (Session["username"] != null)
            {
                string strcon = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string useremail = Session["username"].ToString();
                SqlCommand cmd = new SqlCommand("select name from register where email='" + useremail + "'", con);
                string user = cmd.ExecuteScalar().ToString();
                con.Close();
                txtName.Text = user;
                txtName.ReadOnly = true;
                txtEmail.Text = Session["username"].ToString();
                txtEmail.ReadOnly = true;
            }
                    
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (Page.IsValid)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("spFeedback", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email",txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@Comments", txtComments.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    string str = txtEmail.Text;
                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(str);
                    message.To.Add("hemantmishra854@gmail.com");
                    message.Subject = txtSubject.Text;
                    message.Body = "<b>Sender Name:</b>" + txtName.Text + "<br/>" + "<b>Sender Email:</b>" + txtEmail.Text +
                        "<br/>" + "<b>Sender Comments:</b>" + txtComments.Text;
                    message.IsBodyHtml = true;
                    SmtpClient smtpclient = new SmtpClient("smtp.gmail.com", 587);
                    smtpclient.Credentials = new System.Net.NetworkCredential("hemantmishra854@gmail.com", "h8896820187");
                    smtpclient.EnableSsl = true;
                    smtpclient.Send(message);
                    lblMessage.Text = "Thanks for your valuable suggestions";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    
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