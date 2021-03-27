using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class EmployeeCustomerViewBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }
        protected void updateGridView()
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            String sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }
        protected void search_click(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();
            String sqlQuery = "";
            if (String.IsNullOrEmpty(searchTxt.Value))
            {
                sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer";

            }
            else
            {
                String customer = searchTxt.Value;

                sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer where " +
                "CustomerName = '" + customer + "'";
            }


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }
    }
}