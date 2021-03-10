﻿using System;
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
    public partial class ServiceEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(ddlCustomerList.SelectedValue);
            int ServiceID = int.Parse(ServiceList.SelectedValue);
            int employeeID = int.Parse(employeeList.SelectedValue);
            Page.Validate();
            if (Page.IsValid == true)
            {
                if (ServiceID == 1)
                {
                    string beginDate = HttpUtility.HtmlEncode(TextBox1.Text).ToString();
                    string status = HttpUtility.HtmlEncode(TextBox7.Text).ToString();
                    string address = HttpUtility.HtmlEncode(TextBox2.Text).ToString();
                    string deadline = HttpUtility.HtmlEncode(TextBox4.Text).ToString();


                    String sqlQuery = "Insert INTO Serviceticket(TicketBeginDate, TicketStatus," +
                        "CustomerID, ServiceID, employeeID, Address, deadline) Values('" + beginDate + "','" + status + "','" + customerID + "','" + ServiceID + "','" + employeeID + "','" + address + "' ,'" + deadline + "')";


                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();
                    queryResults.Close();
                    sqlConnect.Close();
                    requestDetail.Text = "Request successful!! You can check Event Detail from Workflow Page";
                    updateGridView();


                }
                else
                {
                    string beginDate = HttpUtility.HtmlEncode(TextBox1.Text).ToString();
                    string status = HttpUtility.HtmlEncode(TextBox7.Text).ToString();
                    string address = "From " + HttpUtility.HtmlEncode(TextBox2.Text).ToString() + " To " + HttpUtility.HtmlEncode(TextBox3.Text).ToString();
                    string deadline = HttpUtility.HtmlEncode(TextBox4.Text).ToString();


                    String sqlQuery = "Insert INTO Serviceticket(TicketBeginDate, TicketStatus," +
                        "CustomerID, ServiceID, employeeID, address, deadline) Values('" + beginDate + "','" + status + "','" + customerID + "','" + ServiceID + "','" + employeeID + "','" + address + "' ,'" + deadline + "')";


                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;


                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();
                    queryResults.Close();
                    sqlConnect.Close();
                    requestDetail.Text = "Request successful!! You can check Event Detail from Workflow Page";
                    updateGridView();
                }
            }

            else
            {
                requestDetail.Text = "Request Failed!! Some required fields are empty.";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
            requestDetail.Text = "";
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            int ServiceID = int.Parse(ServiceList.SelectedValue);
            if (ServiceID == 1)
            {
                TextBox1.Text = DateTime.Now.ToString("g");
                TextBox7.Text = "Initiating Contract";
                TextBox2.Text = "865 East";
                TextBox4.Text = "3/11/2021";
            }
            else
            {
                TextBox1.Text = DateTime.Now.ToString("g");
                TextBox7.Text = "Initiating Contract";
                TextBox2.Text = "865 East";
                TextBox4.Text = "3/11/2021";
                TextBox3.Text = "Harrison 1456";
            }



        }

        protected void customerSelected(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            int custID = int.Parse(ddlCustomerList1.SelectedValue);

            String sqlQuery = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid where customer.customerID = " + custID;

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

            String sqlQuery = "SELECT customer.CustomerName as Name, service.ServiceType,  employee.employeeName, ServiceTicket.TicketBeginDate as Date_Begin, ServiceTicket.TicketStatus, ServiceTicket.Address, " +
                "Serviceticket.Deadline as Deadline_For_Service from serviceTicket inner join" +
                " customer on customer.customerID = serviceTicket.customerID inner join employee on employee.employeeID = serviceTicket.employeeID inner join service on service.serviceid" +
                " = serviceTicket.serviceid";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }

        protected void ServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceID = int.Parse(ServiceList.SelectedValue);
            if (serviceID == 2)
            {
                Label3.Text = "Origin Address:";
                Label4.Visible = true;
                TextBox3.Visible = true;
                TextBox3.Enabled = true;

            }

            else
            {
                Label3.Text = "Address:";
                Label4.Visible = false;
                TextBox3.Visible = false;
                TextBox3.Enabled = false;
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }
    }
}