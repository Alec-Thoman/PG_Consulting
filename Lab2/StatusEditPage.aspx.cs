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
    public partial class StatusEditPage : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            Session["InitialInfoID"] = 1;
            updateGridView();
            
        }

        protected void updateGridView()
        {
            servicesGridView.DataSource = null;
            servicesGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);


            String sqlMain = "SELECT * FROM ServiceTicket WHERE InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable serviceGrid = new DataTable();

            sqlAdapter.Fill(serviceGrid);
            servicesGridView.DataSource = serviceGrid;
            servicesGridView.DataBind();
        }
        protected void ServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //servicesGridView.DataSource = null;
            //servicesGridView.DataBind();
            //SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            //String sqlMain = "SELECT * FROM serviceTicket WHERE ServiceTicket" +
            //    " = serviceTicket.serviceid ";
            //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            //DataTable serviceGridview = new DataTable();

            //sqlAdapter.Fill(serviceGridview);
            //searchView.DataSource = serviceGridview;
            //searchView.DataBind();
        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(servicesGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in servicesGridView.Rows)
            {
                if (row.RowIndex == servicesGridView.SelectedIndex)
                {
                    SqlConnection sqlConnect = new SqlConnection(constr);
                    sqlConnect.Open();

                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;

                    String sqlQueryStatus = "SELECT TicketStatus FROM serviceTicket WHERE ServiceTicketID = " + servicesGridView.SelectedRow.Cells[0].Text;
                    SqlCommand cmd = new SqlCommand(sqlQueryStatus, sqlConnect);
                    String tickStatus = (string)cmd.ExecuteScalar();
                    String sqlQueryNotes = "SELECT TicketStatusNotes FROM serviceTicket WHERE ServiceTicketID = " + servicesGridView.SelectedRow.Cells[0].Text;
                    SqlCommand cmd2 = new SqlCommand(sqlQueryNotes, sqlConnect);
                    String tickNotes = (string)cmd2.ExecuteScalar();

                    txtStatus.Text = tickStatus.Trim();
                    txtStatusNotes.Text = tickNotes.Trim();
                    //String name = e.Row.Cells[0].Text;
                    //String name = HttpUtility.HtmlEncode(Session["customerName"]);
                    sqlConnect.Close();


                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(constr);
            sqlConnect.Open();
            String sqlUpdate ="UPDATE serviceTicket SET TicketStatus = @txtStatus, TicketStatusNotes = @txtStatusNotes WHERE ServiceTicketID = " + servicesGridView.SelectedRow.Cells[0].Text;

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.Add("@txtStatus", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(txtStatus.Text.Trim());
            sqlCommand.Parameters.Add("@txtStatusNotes", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(txtStatusNotes.Text.Trim());
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlUpdate;
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            updateGridView();

            queryResults.Close();
            sqlConnect.Close();
            
        }
    }
}