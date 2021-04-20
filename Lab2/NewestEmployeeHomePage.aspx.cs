using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class NewestEmployeeHomePage : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["DBSource"].Equals("AWS"))
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //}
            //else
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}

            

            //try {
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //    SqlConnection testConn = new SqlConnection(constr);
            //} catch
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}

            statusGridView.DataSource = null;
            statusGridView.DataBind();
            
            SqlConnection sqlConnect = new SqlConnection(constr);


            String sqlMain = "SELECT InitialInfo.LastName as [Last Name], Service.ServiceType as [Service], serviceTicket.TicketStatus as [Status], serviceTicket.Deadline as [Date of Service] FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN Service on Service.ServiceID = serviceTicket.ServiceID ORDER BY " +
            "serviceTicket.Deadline DESC";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable statusGrid = new DataTable();

            sqlAdapter.Fill(statusGrid);
            statusGridView.DataSource = statusGrid;
            statusGridView.DataBind();
        }
        protected void Selection_Change(object sender, EventArgs e)
        {
            if (searchRecordList.SelectedValue == "ActiveCustomers")
            {
                txtDate.Visible = true;
                cityLists.Visible = true;
                storageLists.Visible = false;
            }
            else if (searchRecordList.SelectedValue == "NewCustomers")
            {
                txtDate.Visible = true;
                cityLists.Visible = false;
                storageLists.Visible = false;
            }
            else if (searchRecordList.SelectedValue == "DateofService")
            {
                txtDate.Visible = true;
                cityLists.Visible = false;
                storageLists.Visible = false;
            }
            else if (searchRecordList.SelectedValue == "Storage")
            {
                txtDate.Visible = false;
                cityLists.Visible = false;
                storageLists.Visible = true;
            }


        }
        protected void customerSearch_Click(object sender, EventArgs e)
        {
            customerGridView.DataSource = null;
            customerGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);


            String sqlMain = "SELECT LastName as [Last Name], PhoneNumber as [Phone Number], Email FROM InitialInfo WHERE LastName LIKE '" + txtCustomerSearch.Text + "%'";
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable customerGrid = new DataTable();

            sqlAdapter.Fill(customerGrid);
            customerGridView.DataSource = customerGrid;
            customerGridView.DataBind();
        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(customerGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
                 
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in customerGridView.Rows)
            {
                if (row.RowIndex == customerGridView.SelectedIndex)
                {


                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;



                    String sqlQuery = "SELECT InitialInfoID from InitialInfo WHERE Email = '" + customerGridView.SelectedRow.Cells[2].Text + "'";

                    SqlConnection sqlConnect = new SqlConnection(constr);
                    sqlConnect.Open();
                    SqlCommand cmd = new SqlCommand(sqlQuery, sqlConnect);

                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    //String name = e.Row.Cells[0].Text;
                    //String name = HttpUtility.HtmlEncode(Session["customerName"]);
                    sqlConnect.Close();
                    System.Diagnostics.Debug.WriteLine("test");
                    System.Diagnostics.Debug.WriteLine(id);
                    Session["InitialInfoID"] = id;
                    Response.Redirect("CustomerInfoPage.aspx");



                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void searchClick(object sender, EventArgs e)
        {
            if (searchRecordList.SelectedValue.ToString() == "ActiveCustomers")
            {
                recordsGridView.DataSource = null;
                recordsGridView.DataBind();
                SqlConnection sqlConnect = new SqlConnection(constr);


                String sqlMain = "SELECT InitialInfo.LastName as [Last Name], serviceTicket.Deadline as [Date of Service], Service.ServiceType as [Service] FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN Service on Service.ServiceID = serviceTicket.ServiceID WHERE InitialInfo.City = '" + cityLists.SelectedValue.ToString() +
                    "' AND serviceTicket.Deadline = '" + txtDate.Text + "'";
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

                DataTable serviceGrid = new DataTable();

                sqlAdapter.Fill(serviceGrid);
                recordsGridView.DataSource = serviceGrid;
                recordsGridView.DataBind();
            }
            else if (searchRecordList.SelectedValue.ToString() == "NewCustomers")
            {
                recordsGridView.DataSource = null;
                recordsGridView.DataBind();
                SqlConnection sqlConnect = new SqlConnection(constr);


                String sqlMain = "SELECT InitialInfo.FirstName as [First Name], InitialInfo.LastName as [Last Name], InitialInfo.InitialDate as [Date Created] FROM InitialInfo WHERE InitialInfo.InitialDate = '" + txtDate.Text + "'";
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

                DataTable serviceGrid = new DataTable();

                sqlAdapter.Fill(serviceGrid);
                recordsGridView.DataSource = serviceGrid;
                recordsGridView.DataBind();
            }
            else if (searchRecordList.SelectedValue.ToString() == "DateofService")
            {
                recordsGridView.DataSource = null;
                recordsGridView.DataBind();
                SqlConnection sqlConnect = new SqlConnection(constr);


                String sqlMain = "SELECT InitialInfo.LastName as [Last Name], Service.ServiceType as [Service], InitialInfo.City, serviceTicket.Deadline as [Date of Service] FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN Service on Service.ServiceID = serviceTicket.ServiceID WHERE serviceTicket.Deadline = '" + txtDate.Text + "'";
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

                DataTable serviceGrid = new DataTable();

                sqlAdapter.Fill(serviceGrid);
                recordsGridView.DataSource = serviceGrid;
                recordsGridView.DataBind();
            }
            else if (searchRecordList.SelectedValue.ToString() == "Storage")
            {
                recordsGridView.DataSource = null;
                recordsGridView.DataBind();
                SqlConnection sqlConnect = new SqlConnection(constr);


                String sqlMain = "SELECT InitialInfo.FirstName as [First Name], InitialInfo.LastName as [Last Name], InventoryItem.ItemDescription as [Item], InventoryItem.InitialStorageDate as [Initial Storage Date] FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN InventoryItem on InventoryItem.ServiceTicketID = serviceTicket.ServiceTicketID INNER JOIN Storage on Storage.StorageID = InventoryItem.StorageID WHERE Storage.Location = '" + storageLists.SelectedValue.ToString() + "'";
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

                DataTable serviceGrid = new DataTable();

                sqlAdapter.Fill(serviceGrid);
                recordsGridView.DataSource = serviceGrid;
                recordsGridView.DataBind();
            }
        }
        protected void StatusRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(statusGridView, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
        protected void StatusSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in statusGridView.Rows)
            {
                if (row.RowIndex == statusGridView.SelectedIndex)
                {


                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;

                    String sqlQuery = "SELECT InitialInfo.InitialInfoID FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN Service on Service.ServiceID = serviceTicket.ServiceID WHERE " +
                    "InitialInfo.LastName = '" + statusGridView.SelectedRow.Cells[0].Text + "' AND Service.ServiceType = '" + statusGridView.SelectedRow.Cells[1].Text +
                    "' AND serviceTicket.TicketStatus = '" + statusGridView.SelectedRow.Cells[2].Text + "' AND serviceTicket.Deadline = '" + statusGridView.SelectedRow.Cells[3].Text +"'";

                    SqlConnection sqlConnect = new SqlConnection(constr);
                    sqlConnect.Open();
                    SqlCommand cmd = new SqlCommand(sqlQuery, sqlConnect);

                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    //String name = e.Row.Cells[0].Text;
                    //String name = HttpUtility.HtmlEncode(Session["customerName"]);
                    sqlConnect.Close();
                    System.Diagnostics.Debug.WriteLine("test");
                    System.Diagnostics.Debug.WriteLine(id);
                    Session["InitialInfoID"] = id;
                    Response.Redirect("CustomerInfoPage.aspx");



                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
    }
}