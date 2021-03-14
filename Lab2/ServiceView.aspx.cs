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
    public partial class ViewService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            String sqlMain = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid ";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            String sqlMain = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid ";
            SqlDataAdapter objSQLAdapter;
            String sqlHolder = "";

            if (String.IsNullOrEmpty(txtName.Text) && String.IsNullOrEmpty(txtDate.Text))
            {
                sqlHolder = sqlMain + " where serviceTicket.Address = '" + txtAddress.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Address = '" + txtAddress.Text + "'", sqlConnect);

            }
            else if (String.IsNullOrEmpty(txtDate.Text) && String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + txtName.Text + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtName.Text) && String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + txtDate.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Deadline = '" + txtDate.Text + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtName.Text))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtDate.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'", sqlConnect);
            }
            else if (String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "'", sqlConnect);
            }
            else
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
                objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
               " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'", sqlConnect);
            }



            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlHolder, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();

            //SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
            //   " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + Session["CustomerName"] + "'", sqlConnect);
            DataSet objDataSet = new DataSet();
            objSQLAdapter.Fill(objDataSet);
            Ticket.DataSource = objDataSet;
            Ticket.DataTextField = "Name";
            Ticket.DataValueField = "TicketID";
            Ticket.DataBind();
            Ticket.Items.Insert(0, new ListItem("--Select ServiceTicket--", "0"));

            //grdCustomer.DataSource = workflowGridview;
            //grdCustomer.DataBind();

            //SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
            //   " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where customer.customerName = '" + Session["CustomerName"] + "'", sqlConnect);
            //DataSet objDataSet = new DataSet();
            //objSQLAdapter.Fill(objDataSet);
            //Ticket.DataSource = objDataSet;
            //Ticket.DataTextField = "Name";
            //Ticket.DataValueField = "TicketID";
            //Ticket.DataBind();
            //Ticket.Items.Insert(0, new ListItem("--Select ServiceTicket--", "0"));
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }
        protected void ServiceTicketSelected(object sender, EventArgs e)
        {
            int ticketID = int.Parse(Ticket.SelectedValue);
            TicketHistory.DataSource = null;
            TicketHistory.DataBind();


            String sqlQuery = "SELECT customer.CustomerName, service.ServiceType, TicketHistory.ChangeDate as Date_Change, TicketHistory.NoteTitle, employee.EmployeeName from tickethistory inner" +
                " join serviceTicket on serviceTicket.serviceTicketID = ticketHistory.serviceTicketID inner join customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID " +
                "= ticketHistory.employeeID inner join service on service.serviceid = serviceticket.serviceid where serviceTicket.serviceTicketid = " + ticketID;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            TicketHistory.DataSource = workflowGridview;
            TicketHistory.DataBind();

            SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select tickethistory.NoteTitle, tickethistory.tickethistoryID from tickethistory where tickethistory.serviceTicketID=" + ticketID, sqlConnect);
            DataSet objDataSet = new DataSet();
            objSQLAdapter.Fill(objDataSet);
            Note.DataSource = objDataSet;
            Note.DataTextField = "NoteTitle";
            Note.DataValueField = "tickethistoryID";
            Note.DataBind();
            Note.Items.Insert(0, new ListItem("--Select Note Title to view Details--", "0"));
        }

        protected void Note_SelectedIndexChanged(object sender, EventArgs e)
        {
            int noteID = int.Parse(Note.SelectedValue);
            NoteBody.DataSource = null;
            NoteBody.DataBind();


            String sqlQuery = "Select tickethistory.NoteTitle as Note_Title, tickethistory.NoteBody as Note_Body from tickethistory where tickethistory.tickethistoryid = " + noteID;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            NoteBody.DataSource = workflowGridview;
            NoteBody.DataBind();
        }
        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtName.Text = "William";
            txtDate.Text = "3/11/2021";
        }
    }
}