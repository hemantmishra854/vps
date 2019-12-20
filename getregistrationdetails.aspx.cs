using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class WebForm27 : System.Web.UI.Page
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
        

            if (!IsPostBack)
            {
                getDataFromDB();
            }
        }
        private void getDataFromDB()
        {
            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("select * from register", con);
            DataSet ds = new DataSet();
            da.Fill(ds,"Users");
            ds.Tables["Users"].PrimaryKey = new DataColumn[] { ds.Tables["Users"].Columns["Email"] };
            Cache.Insert("DataSet", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        private void getDataFromCache()
        {
            if (Cache["DataSet"] != null)
            {
                DataSet ds = (DataSet)Cache["DataSet"];
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }


        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            getDataFromCache();
        
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            if (Cache["DataSet"] != null)
            {
                DataSet ds = (DataSet)Cache["DataSet"];
                DataRow dr = ds.Tables["Users"].Rows.Find(e.Keys["Email"]);
                dr["Name"] = e.NewValues["Name"];
                Cache.Insert("DataSet", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
                GridView1.EditIndex = -1;
                getDataFromCache();
            }

        }

        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            getDataFromCache();
        
        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            if (Cache["DataSet"] != null)
            {
                DataSet ds = (DataSet)Cache["DataSet"];
                DataRow dr = ds.Tables["Users"].Rows.Find(e.Keys["Email"]);
                dr.Delete();
                Cache.Insert("DataSet", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
                getDataFromCache();
            }

        }

        protected void btnSavaData_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("select * from register", con);
            DataSet ds = (DataSet)Cache["DataSet"];
            string updateQuery = "update register set Name=@Name where Email=@Email";
            SqlCommand updateCommand = new SqlCommand(updateQuery, con);
            updateCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50, "Name");
            updateCommand.Parameters.Add("@Email", SqlDbType.VarChar, 50, "Email");
            da.UpdateCommand = updateCommand;

            string deleteQuery = "delete from register  where Email=@Email";
            SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
            deleteCommand.Parameters.Add("@Email", SqlDbType.VarChar, 50, "Email");
            da.DeleteCommand = deleteCommand;

            da.Update(ds, "Users");
            Label1.Text = "Database updated successfully";
            Label1.ForeColor = System.Drawing.Color.Green;

            
        }



    }
}