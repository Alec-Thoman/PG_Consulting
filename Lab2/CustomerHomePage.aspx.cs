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
using System.Drawing;

namespace Lab2
{
    public partial class CustomerHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                lblUserLoggedIn.ForeColor = Color.Green;
                lblUserLoggedIn.Font.Bold = true;
                lblUserLoggedIn.Text = Session["UserName"].ToString() + " successfully login";
            }

            else
            {
                Session["InvalidUse"] = "You must first login to acess the application page";
                Response.Redirect("CustomerLoginPage.aspx");
            }
        }

        protected void btnInformation_Click(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            

            String sqlQuery = "SELECT customer.CustomerName as Name, customer.customeraddress as Address, customer.EmailAddress, customer.PhoneNumber, Customer.ContactWay as Initially_Contact, customer.hearabout " +
                "as Hear_About_Us from customer where customer.emailaddress = '" + Session["UserName"]+"'";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();


        }

        protected void btnPastEvent_Click(object sender, EventArgs e)
        {
            grdEvent.DataSource = null;
            grdEvent.DataBind();

            String sqlQuery = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid where customer.emailaddress = '" + Session["UserName"] + "'";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdEvent.DataSource = workflowGridview;
            grdEvent.DataBind();
        }



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("CustomerLoginPage.aspx?loggedout=true");
        }

        protected void btnpopulate_Click(object sender, EventArgs e)
        {
            txtName.Text = "Jacob";
            txtDate.Text = "3/23/2021";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
            lblStatus.Text = "";

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["Notification"] = txtName.Text + "request " + ServiceList.SelectedValue + " Event On " + txtDate.Text;
            Details.Text = "Request Successful, Notification sent!";
        }
    }
}