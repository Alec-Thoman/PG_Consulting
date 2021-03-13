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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            searchView.DataSource = null;
            searchView.DataBind();

            String sqlMain = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid ";
            String sqlHolder = "";
            
            if (String.IsNullOrEmpty(txtName.Text) && String.IsNullOrEmpty(txtDate.Text))
            {
                sqlHolder = sqlMain + " where serviceTicket.Address = '" + txtAddress.Text + "'";

            }
            else if(String.IsNullOrEmpty(txtDate.Text) && String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "'";
            }
            else if(String.IsNullOrEmpty(txtName.Text) && String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + txtDate.Text + "'";
            }
            else if (String.IsNullOrEmpty(txtName.Text))
            {
                sqlHolder = sqlMain + "where serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
            }
            else if (String.IsNullOrEmpty(txtDate.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
            }
            else if (String.IsNullOrEmpty(txtAddress.Text))
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "'";
            }
            else
            {
                sqlHolder = sqlMain + "where customer.customerName = '" + txtName.Text + "' AND serviceTicket.Deadline = '" + txtDate.Text + "' AND serviceTicket.Address = '" + txtAddress.Text + "'";
            }

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlHolder, sqlConnect);

            DataTable serviceGridview = new DataTable();

            sqlAdapter.Fill(serviceGridview);
            searchView.DataSource = serviceGridview;
            searchView.DataBind();

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
    }
}