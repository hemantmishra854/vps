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
    public partial class WebForm29 : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("select * from passportDetails", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "PassportDetails");
            ds.Tables["PassportDetails"].PrimaryKey = new DataColumn[] { ds.Tables["PassportDetails"].Columns["Id"] };
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
                DataRow dr = ds.Tables["PassportDetails"].Rows.Find(e.Keys["Id"]);
                dr["PassportNo"] = e.NewValues["PassportNo"];
                dr["IssueDate"] = e.NewValues["IssueDate"];
                dr["ExpiryDate"] = e.NewValues["ExpiryDate"];
                dr["IssuePlace"] = e.NewValues["IssuePlace"];
                dr["VisaType"] = e.NewValues["VisaType"];
                dr["VisaCategory"] = e.NewValues["VisaCategory"];
                dr["UserId"] = e.NewValues["UserId"];
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
                DataRow dr = ds.Tables["Passportdetails"].Rows.Find(e.Keys["Id"]);
                dr.Delete();
                Cache.Insert("DataSet", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
                getDataFromCache();
            }

        }


        protected void btnGetData_Click(object sender, EventArgs e)
        {
            getDataFromDB();
        }

        protected void btnSavaData_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["visadbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("select * from passportdetails", con);
            DataSet ds = (DataSet)Cache["DataSet"];
            string updateQuery = "update passportdetails set PassportNo=@PassportNo,IssueDate=@VisaDate,ExpiryDate=@Duration,IssuePlace=@Destination,VisaType=@VisaType,VisaCategory=@VisaCategory,UserId=@UserId where Id=@Id";
            SqlCommand updateCommand = new SqlCommand(updateQuery, con);
            updateCommand.Parameters.Add("@PassportNo", SqlDbType.VarChar, 50, "PassportNo");
            updateCommand.Parameters.Add("@VisaDate", SqlDbType.VarChar, 50, "VisaDate");
            updateCommand.Parameters.Add("@Duration", SqlDbType.VarChar, 50, "Duration");
            updateCommand.Parameters.Add("@Destination", SqlDbType.VarChar, 50, "Destination");
            updateCommand.Parameters.Add("@VisaType", SqlDbType.VarChar, 50, "VisaType");
            updateCommand.Parameters.Add("@VisaCategory", SqlDbType.VarChar, 50, "VisaCategory");
            updateCommand.Parameters.Add("@UserId", SqlDbType.VarChar, 50, "UserId");
            updateCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");
            da.UpdateCommand = updateCommand;

            string deleteQuery = "delete from passportdetails  where Id=@Id";
            SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
            deleteCommand.Parameters.Add("@Id", SqlDbType.VarChar, 50, "Id");
            da.DeleteCommand = deleteCommand;

            da.Update(ds, "PassportDetails");
            Label1.Text = "Database updated successfully";
            Label1.ForeColor = System.Drawing.Color.Green;
        }



    }
}