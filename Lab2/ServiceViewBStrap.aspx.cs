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
    public partial class ServiceViewBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            String sqlMain = "SELECT customer.CustomerName as [Customer Name], service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid ";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();
        }
        protected void search_click(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            String sqlMain = "SELECT customer.CustomerName as [Customer Name], service.ServiceType as [Service Type],  employee.employeeName as [Employee Name], ServiceTicket.TicketBeginDate as [Date Created], ServiceTicket.TicketStatus as Status, ServiceTicket.Address, " +
                "Serviceticket.Deadline as [Date of Service] from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid ";
            SqlDataAdapter objSQLAdapter;
            String sqlHolder = "";

            if (String.IsNullOrEmpty(txtName.Value) && String.IsNullOrEmpty(txtDate.Value) && String.IsNullOrEmpty(txtAddress.Value))
            {
                sqlHolder = sqlMain;
            }
            else if (String.IsNullOrEmpty(txtName.Value) && String.IsNullOrEmpty(txtDate.Value))
            {
                sqlHolder = sqlMain + " where serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'", sqlConnect);

            }
            else if (String.IsNullOrEmpty(txtDate.Value) && String.IsNullOrEmpty(txtAddress.Value))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtName.Value) && String.IsNullOrEmpty(txtAddress.Value))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtName.Value))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtDate.Value))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtAddress.Value))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "'", sqlConnect);
            }
            else
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where where customer.customerName = '" + HttpUtility.HtmlEncode(txtName.Value) + "' AND serviceTicket.Deadline = '" + HttpUtility.HtmlEncode(txtDate.Value) + "' AND serviceTicket.Address = '" + HttpUtility.HtmlEncode(txtAddress.Value) + "'", sqlConnect);
            }



            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlHolder, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();

            //SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
            //   " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + Session["CustomerName"] + "'", sqlConnect);
            //    DataSet objDataSet = new DataSet();
            //    objSQLAdapter.Fill(objDataSet);
            //    Ticket.DataSource = objDataSet;
            //    Ticket.DataTextField = "Name";
            //    Ticket.DataValueField = "TicketID";
            //    Ticket.DataBind();
            //    Ticket.Items.Insert(0, new ListItem("--Select ServiceTicket--", "0"));
        }
        protected void populate_click(object sender, EventArgs e)
        {
            txtName.Value = "Peter";
            txtAddress.Value = "451 Demaskus Drive Harrisonburg VA 22801";
            txtDate.Value = "2/10/2021";
        }
    }
}