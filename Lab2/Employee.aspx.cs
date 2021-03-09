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
    //Create By Yuhui AND Jocab 2/15/2021
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }




        protected void customerSelected(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            int custID = int.Parse(ddlCustomerList.SelectedValue);

            String sqlQuery = "SELECT employee.EmployeeName as Name, Employee.Position, employee.EmailAddress, employee.CellNumber from employee where employee.employeeID = " + custID;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }

        protected void updateGridView()
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            String sqlQuery = "SELECT employee.EmployeeName as Name, Employee.Position, employee.EmailAddress, employee.CellNumber from employee";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            updateGridView();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }
    }
}