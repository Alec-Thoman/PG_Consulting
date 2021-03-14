using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab2
{
    //Create By Yuhui AND Jocab 2/15/2020
    public partial class LoginAwareHomePage : System.Web.UI.Page
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
                Response.Redirect("EmployeeLoginPage.aspx");
            }

            if (Session["Notification"] != null)
            {
                lblNotification.ForeColor = Color.Green;
                lblNotification.Font.Bold = true;
                lblNotification.Text = Session["Notification"].ToString();
                Remove.Visible = true;
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("EmployeeLoginPage.aspx?loggedout=true");

        }

        protected void btnInitialContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactInfo.aspx");
        }

        protected void newCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }

        protected void serviceEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceEvent.aspx");
        }
        protected void viewService_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceView.aspx");
        }

        protected void workflow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Workflow.aspx");
        }

        protected void employee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        protected void invenory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inventory.aspx");
        }

        protected void Remove_Click(object sender, EventArgs e)
        {

        }

    }
}