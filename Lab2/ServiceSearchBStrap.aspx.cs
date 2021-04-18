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
    public partial class ServiceSearchBStrap : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DBSource"].Equals("AWS"))
            {
                constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            }
            else
            {
                constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            }
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
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(recordsGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";


            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in recordsGridView.Rows)
            {
                if (row.RowIndex == recordsGridView.SelectedIndex)
                {


                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;





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
    }
}