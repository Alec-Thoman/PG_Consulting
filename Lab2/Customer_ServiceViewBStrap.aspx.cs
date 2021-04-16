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
        private int initialInfoID = 7;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = HttpUtility.HtmlEncode(Session["UserName"].ToString());
                //uname = email.Substring(0, email.IndexOf("@"));
            }

            // Loop to get custID
            String customerIDQuery = "select CustomerID from Customer where EmailAddress = @email";
            SqlCommand cmd = new SqlCommand(customerIDQuery, sqlConnect);
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    this.initialInfoID = (int)reader["CustomerID"];
                }
            }

            String sqlMain = "SELECT customer.CustomerName as [Customer Name], service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid where customer.CustomerID = " + this.initialInfoID;

            String sqlQuery = "SELECT InitialInfo.FirstName, InitialInfo.LastName, service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " InitialInfo on InitialInfo.InitialInfoID = serviceTicket.InitialInfoID inner join" +
                " employee on employee.employeeID = serviceTicket.employeeID inner join" +
                //" service on service.serviceid = serviceTicket.serviceid where customer.CustomerName = '" + this.custID + "'";
                " service on service.serviceid = serviceTicket.serviceid where InitialInfo.InitialInfoID = " + this.initialInfoID;



            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();
        }
    }
}