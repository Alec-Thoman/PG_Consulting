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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(ddlCustomerList.SelectedValue);
            int ServiceID = int.Parse(ServiceList.SelectedValue);
            String status = txtStatus.Text;
  
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    
                    String sqlQuery1 = "Update serviceTicket set TicketStatus = '" + status + "' where CustomerId = " + customerID + " and ServiceID = " + ServiceID;


                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlQuery1;

            sqlConnect.Open();
            SqlDataReader queryResults1 = sqlCommand2.ExecuteReader();
                    queryResults1.Close();
                    updateGridView();
                        

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }


        protected void updateGridView()
        {
            grdCustomerStatus.DataSource = null;
            grdCustomerStatus.DataBind();

            String sqlQuery = "SELECT CustomerName as Name_Client, ServiceType, TicketStatus from serviceTicket inner join service on serviceTicket.serviceID = service.serviceID " +
                "inner join customer on customer.customerID = serviceTicket.CustomerID where ticketstatus != 'Completion'";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomerStatus.DataSource = workflowGridview;
            grdCustomerStatus.DataBind();
        }
    }
}
