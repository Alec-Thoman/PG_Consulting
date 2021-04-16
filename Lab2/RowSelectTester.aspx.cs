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
    public partial class EmployeeCustomerViewBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
            Session["customerName"] = "test";
        }
        protected void updateGridView()
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            String sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }
        protected void search_click(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();
            String sqlQuery = "";
            if (String.IsNullOrEmpty(searchTxt.Value))
            {
                sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer";

            }
            else
            {
                String customer = searchTxt.Value;

                sqlQuery = "SELECT CustomerName as [Customer Name], PhoneNumber as [Phone Number], EmailAddress as [Email], CustomerAddress as [Home Address] from Customer where " +
                "CustomerName = '" + HttpUtility.HtmlEncode(customer) + "'";
            }


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomer.DataSource = workflowGridview;
            grdCustomer.DataBind();
        }

        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    TextBoxUserID.Text = GridView1.SelectedRow.Cells[1].Text;
        //    TextBoxUserName.Text = GridView1.SelectedRow.Cells[2].Text;
        //}
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdCustomer, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
                
                String sqlQuery = "SELECT CustomerName from Customer WHERE EmailAddress = '" + e.Row.Cells[2].Text + "'";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlConnect);

                String name = (string)cmd.ExecuteScalar();
                //String name = e.Row.Cells[0].Text;
                //String name = HttpUtility.HtmlEncode(Session["customerName"]);
                sqlConnect.Close();
                System.Diagnostics.Debug.WriteLine("You click me ..................");
                System.Diagnostics.Debug.WriteLine(name);
                e.Row.Cells[1].Attributes.Add("onClick", "alert('" + name +"');");
                //e.Row.Attributes.Add("onClick", "e.Row.BackColor = ColorTranslator.FromHtml('#9dbdb9')");
            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdCustomer.Rows)
            {
                if (row.RowIndex == grdCustomer.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;
                    TextBoxUserID.Text = grdCustomer.SelectedRow.Cells[1].Text;
                    TextBoxUserName.Text = grdCustomer.SelectedRow.Cells[2].Text;
                    Session["customerName"] =grdCustomer.SelectedRow.Cells[2].Text;

                    // Alec added this to test out (commented out for now)
                    //Response.Redirect("CustomerInfoPage.aspx");
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