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
    public partial class WebForm28 : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("select * from tblUserAddress", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "AddressDetails");
            ds.Tables["AddressDetails"].PrimaryKey = new DataColumn[] { ds.Tables["AddressDetails"].Columns["Id"] };
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
                DataRow dr = ds.Tables["AddressDetails"].Rows.Find(e.Keys["Id"]);
                dr["Street"] = e.NewValues["Street"];
                dr["City"] = e.NewValues["City"];
                dr["State"] = e.NewValues["State"];
                dr["Country"] = e.NewValues["Country"];
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
                DataRow dr = ds.Tables["Addressdetails"].Rows.Find(e.Keys["Id"]);
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
            SqlDataAdapter da = new SqlDataAdapter("select * from tblUserAddress", con);
            DataSet ds = (DataSet)Cache["DataSet"];
            string updateQuery = "update tblUserAddress set Street=@Street,City=@City,State=@State,Country=@Country,UserId=@UserId where Id=@Id";
            SqlCommand updateCommand = new SqlCommand(updateQuery, con);
            updateCommand.Parameters.Add("@Street", SqlDbType.VarChar, 50, "Street");
            updateCommand.Parameters.Add("@City", SqlDbType.VarChar, 50, "City");
            updateCommand.Parameters.Add("@State", SqlDbType.VarChar, 50, "State");
            updateCommand.Parameters.Add("@Country", SqlDbType.VarChar, 50, "Country");
            updateCommand.Parameters.Add("@UserId", SqlDbType.VarChar, 50, "UserId");
            updateCommand.Parameters.Add("@Id", SqlDbType.Int, 0, "Id");
            da.UpdateCommand = updateCommand;

            string deleteQuery = "delete from tblUserAddress  where Id=@Id";
            SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
            deleteCommand.Parameters.Add("@Id", SqlDbType.VarChar, 50, "Id");
            da.DeleteCommand = deleteCommand;

            da.Update(ds, "AddressDetails");
            Label1.Text = "Database updated successfully";
            Label1.ForeColor = System.Drawing.Color.Green;


        }



    }
}