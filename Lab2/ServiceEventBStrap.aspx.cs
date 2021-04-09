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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void request_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(ddlCustomerList.SelectedValue);
            int ServiceID = int.Parse(ServiceList.SelectedValue);
            int employeeID = int.Parse(employeeList.SelectedValue);
            Page.Validate();
            if (Page.IsValid == true)
            {
                if (ServiceID == 1)
                {
                    string beginDate = HttpUtility.HtmlEncode(ticketOpenDate.Value).ToString();
                    string status = HttpUtility.HtmlEncode(ticketStatus.Value).ToString();
                    string address = HttpUtility.HtmlEncode(addressTxt.Value).ToString();
                    string deadline = HttpUtility.HtmlEncode(deadlineDate.Value).ToString();
                    Session["notes"] = notesTxt.Value;


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

                    //Initial ticket history
                    int ticketID = 0;
                    String result = "";

                    String sqlIDQuery = "Select MAX(ServiceticketID) from serviceTicket";
                    SqlCommand sqlCommand1 = new SqlCommand();
                    sqlCommand1.Connection = sqlConnect;
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlCommand1.CommandText = sqlIDQuery;

                    SqlDataReader queryIDResults = sqlCommand1.ExecuteReader();

                    while (queryIDResults.Read())
                    {
                        result = queryIDResults[0].ToString();
                    }
                    queryIDResults.Close();

                    ticketID = Int32.Parse(result);
                    String noteTitle = "Initial Contract";
                    String noteBody = Session["notes"].ToString();
                    String changeDate = DateTime.Now.ToString("g");

                    String sqlQuery1 = "Insert INTO tickethistory(NoteTitle, NoteBody, changeDate, employeeID, serviceTicketID ) Values('" + noteTitle + "','" + noteBody + "','" + changeDate + "','" + employeeID + "','" + ticketID + "')";

                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlQuery1;


                    SqlDataReader queryResults1 = sqlCommand2.ExecuteReader();
                    queryResults1.Close();
                    sqlConnect.Close();
                    requestDetail.InnerText = "Request successful!! You can check Event Detail from Workflow Page";
                    //updateGridView(); //No longer Needed. Delete after completion


                }
                else
                {
                    string beginDate = HttpUtility.HtmlEncode(ticketOpenDate.Value).ToString();
                    string status = HttpUtility.HtmlEncode(ticketStatus.Value).ToString();
                    string address = "From " + HttpUtility.HtmlEncode(addressTxt.Value).ToString() + " To " + HttpUtility.HtmlEncode(destinationTxt.Value).ToString();
                    string deadline = HttpUtility.HtmlEncode(deadlineDate.Value).ToString();
                    Session["notes"] = notesTxt.Value;


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

                    //Initial ticket history
                    int ticketID = 0;
                    String result = "";

                    String sqlIDQuery = "Select MAX(ServiceticketID) from serviceTicket";
                    SqlCommand sqlCommand1 = new SqlCommand();
                    sqlCommand1.Connection = sqlConnect;
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlCommand1.CommandText = sqlIDQuery;

                    SqlDataReader queryIDResults = sqlCommand1.ExecuteReader();

                    while (queryIDResults.Read())
                    {
                        result = queryIDResults[0].ToString();
                    }
                    queryIDResults.Close();

                    ticketID = Int32.Parse(result);
                    String noteTitle = "Initial Contract";
                    String noteBody = Session["notes"].ToString(); //the problem
                    String changeDate = DateTime.Now.ToString("g");

                    String sqlQuery1 = "Insert INTO tickethistory(NoteTitle, NoteBody, changeDate, employeeID, serviceTicketID ) Values('" + noteTitle + "','" + noteBody + "','" + changeDate + "','" + employeeID + "','" + ticketID + "')";

                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlQuery1;


                    SqlDataReader queryResults1 = sqlCommand2.ExecuteReader();
                    queryResults1.Close();
                    sqlConnect.Close();

                    requestDetail.InnerText = "Request successful!! You can check Event Detail from Workflow Page";
                    //updateGridView(); //No longer Needed. Delete after completion
                }
            }

            else
            {
                requestDetail.InnerText = "Request Failed!! Some required fields are empty.";
            }

        }
        protected void populate_Click(object sender, EventArgs e)
        {
            
                ddlCustomerList.SelectedValue = "3";
                employeeList.SelectedValue = "2";
                ticketOpenDate.Value = "03/30/2021";
                deadlineDate.Value = "04/05/2021";
                ticketStatus.Value = "Initiating Contract";
                addressTxt.Value = "865 East Street Harrisonburg VA 22801";
                notesTxt.Value = "Big items. Must call for further clarification";
            
                
        }
            protected void ServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceID = int.Parse(ServiceList.SelectedValue);
            if (serviceID == 2)
            {
                addressLbl.InnerText = "Origin Address:";
                destinationLbl.Visible = true;
                destinationTxt.Visible = true;
                //TextBox3.Enabled = true;

            }

            else
            {
                addressLbl.InnerText = "Address:";
                destinationLbl.Visible = false;
                destinationTxt.Visible = false;
                //TextBox3.Enabled = false;
            }
        }

    }
}