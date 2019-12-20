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
    public partial class WebForm26 : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("select * from personaldetails", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "PersonalDetails");
            ds.Tables["PersonalDetails"].PrimaryKey = new DataColumn[] { ds.Tables["PersonalDetails"].Columns["Id"] };
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
                DataRow dr = ds.Tables["PersonalDetails"].Rows.Find(e.Keys["Id"]);
                dr["FathersName"] = e.NewValues["FathersName"];
                dr["MothersName"] = e.NewValues["MothersName"];
                dr["DOB"] = e.NewValues["DOB"];
                dr["ContactNo"] = e.NewValues["ContactNo"];
                dr["Gender"] = e.NewValues["Gender"];
                dr["MarritulStatus"] = e.NewValues["MarritulStatus"];
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
                DataRow dr = ds.Tables["Personaldetails"].Rows.Find(e.Keys["Id"]);
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
            SqlDataAdapter da = new SqlDataAdapter("select * from personaldetails", con);
            DataSet ds = (DataSet)Cache["DataSet"];
            string updateQuery = "update personaldetails set FathersName=@FathersName,MothersName=@MothersName,DOB=@DOB,ContactNo=@ContactNo,Gender=@Gender,MarritulStatus=@MarritulStatus,UserId=@UserId where Id=@Id";
            SqlCommand updateCommand = new SqlCommand(updateQuery, con);
            updateCommand.Parameters.Add("@FathersName", SqlDbType.VarChar, 50, "FathersName");
            updateCommand.Parameters.Add("@MothersName", SqlDbType.VarChar, 50, "MothersName");
            updateCommand.Parameters.Add("@DOB", SqlDbType.VarChar, 50, "DOB");
            updateCommand.Parameters.Add("@ContactNo", SqlDbType.VarChar, 50, "ContactNo");
            updateCommand.Parameters.Add("@Gender", SqlDbType.VarChar, 50, "Gender");
            updateCommand.Parameters.Add("@MarritulStatus", SqlDbType.VarChar, 50, "MarritulStatus");
            updateCommand.Parameters.Add("@UserId", SqlDbType.VarChar, 50, "UserId");
            updateCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");
            da.UpdateCommand = updateCommand;

            string deleteQuery = "delete from personaldetails  where Id=@Id";
            SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
            deleteCommand.Parameters.Add("@Id", SqlDbType.VarChar, 50, "Id");
            da.DeleteCommand = deleteCommand;

            da.Update(ds, "PersonalDetails");
            Label1.Text = "Database updated successfully";
            Label1.ForeColor = System.Drawing.Color.Green;


        }



    }
}