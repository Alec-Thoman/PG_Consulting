using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class Customer_ServiceViewBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            //Console.WriteLine(Session["UserName"].ToString());
            String email = Session["UserName"].ToString();
            String uname = email.Substring(0, email.IndexOf("@"));



            String sqlMain = "SELECT customer.CustomerName as [Customer Name], service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid where customer.CustomerName = " + uname;

            String sqlQuery = "SELECT customer.CustomerName as [Customer Name], service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join" +
                " employee on employee.employeeID = serviceTicket.employeeID inner join" +
                " service on service.serviceid = serviceTicket.serviceid where customer.CustomerName = '" + uname + "'";



            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();
        }
    }
}