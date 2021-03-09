using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Lab2
{
    //Create By Yuhui AND Jocab 2/15/2021
    public partial class Workflow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(TextBox2.Text.ToLower() == "auction")
            {
                btnAuctionEvent.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            updateGridView();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            grdWorkflow.DataSource = null;
            grdWorkflow.DataBind();
        }

        protected void customerSelected(object sender, EventArgs e)
        {
            grdWorkflow.DataSource = null;
            grdWorkflow.DataBind();

            int custID = int.Parse(ddlCustomerList.SelectedValue);

            String sqlQuery = "SELECT customer.CustomerName as Name, service.ServiceType, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid where customer.customerID = " + custID;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdWorkflow.DataSource = workflowGridview;
            grdWorkflow.DataBind();

            SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select customer.customername+ ' ' + CAST(serviceTicket.TicketBeginDate AS varchar(20))+ ' ' + CAST(service.ServiceType AS varchar(20)) as Name, serviceTicket.serviceTicketID as TicketID from serviceTicket inner join customer on" +
                " customer.customerID = serviceTicket.customerID inner join service on service.serviceID = serviceTicket.serviceid where serviceTicket.customerID=" + custID, sqlConnect);
            DataSet objDataSet = new DataSet();
            objSQLAdapter.Fill(objDataSet);
            Ticket.DataSource = objDataSet;
            Ticket.DataTextField = "Name";
            Ticket.DataValueField = "TicketID";
            Ticket.DataBind();
            Ticket.Items.Insert(0, new ListItem("--Select ServiceTicket--"));

        }

        protected void updateGridView()
        {
            grdWorkflow.DataSource = null;
            grdWorkflow.DataBind();


            String sqlQuery = "SELECT customer.CustomerName as Name, service.ServiceType, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdWorkflow.DataSource = workflowGridview;
            grdWorkflow.DataBind();

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

        protected void updateHistory()
        {
            int ticketID = int.Parse(Ticket.SelectedValue);
            TicketHistory.DataSource = null;
            TicketHistory.DataBind();


            String sqlQuery = "SELECT customer.CustomerName, service.ServiceType, TicketHistory.ChangeDate as Date_Change, TicketHistory.NoteTitle, employee.EmployeeName from tickethistory inner" +
                " join serviceTicket on serviceTicket.serviceTicketID = ticketHistory.serviceTicketID inner join customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID " +
                "= ticketHistory.employeeID inner join service on service.serviceid = serviceticket.serviceid  where serviceTicket.serviceTicketid = " + ticketID;

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

        protected void Populate_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "3/11/2021";
            TextBox2.Text = "Auction";
            TextBox3.Text = "Assign the Inventory to Auction Event";

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {

                String date = HttpUtility.HtmlEncode(TextBox1.Text).ToString();
                String title = HttpUtility.HtmlEncode(TextBox2.Text).ToString();
                String body = HttpUtility.HtmlEncode(TextBox3.Text).ToString();
                int ticketID = int.Parse(Ticket.SelectedValue);
                int employeeID = int.Parse(employeeList.SelectedValue);




                String sqlQuery = "Insert INTO tickethistory(NoteTitle, NoteBody, changeDate, employeeID, serviceTicketID ) Values('" + title + "','" + body + "','" + date + "','" + employeeID + "','" + ticketID + "')";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                queryResults.Close();
                sqlConnect.Close();
                UpdateDetail.Text = "Update Successful!";

                updateHistory();
            }
            else
                UpdateDetail.Text = "Update failed! Some required fields are empty.";

        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);

        }
        void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }

        protected void btnAuctionEvent_Click(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
           
        }
    }
}