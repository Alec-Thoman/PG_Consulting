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
    public partial class CustomerInfoPage_Forms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["InitialInfoID"] = 1;
        }
        protected void order_Click(object sender, EventArgs e)
        {

        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(formsGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";


            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in formsGridView.Rows)
            {
                if (row.RowIndex == formsGridView.SelectedIndex)
                {
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    sqlConnect.Open();

                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;

                    formFrame.Visible = true;
                    formFrame.Src = "MoveAssessment.aspx";
                    Session["IsForm"] = "true";


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
        protected void assessments_Click(object sender, EventArgs e)
        {

            Session["OrderForm"] = "false";
            Session["CompletionForm"] = "false";
            Session["AppraisalForm"] = "false";
            Session["LookAtForm"] = "false";
            Session["AssessmentForm"] = "true";

            formsGridView.DataSource = null;
            formsGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            String sqlMain = "SELECT 'Move' as [Service Type], Preliminary.DateCreated as [Date Created], Preliminary.MoveOutDate as [Date of Service] From InitialInfo INNER JOIN MoveAssessment on MoveAssessment.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN " +
                "Preliminary on Preliminary.MoveID = MoveAssessment.MoveID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
            formFrame.Src = "ServiceSearchBStrap.aspx";
        }
        protected void addForm_Click(object sender, EventArgs e)
        {
            formFrame.Visible = true;
            if (Session["OrderForm"].ToString() == "true")
            {
                formFrame.Src = " ";
            }
            else if (Session["CompletionForm"].ToString() == "true")
            {
                formFrame.Src = " ";
            }
            else if (Session["AppraisalForm"].ToString() == "true")
            {
                formFrame.Src = " ";
            }
        }
        protected void addMoveForm_Click(object sender, EventArgs e)
        {
            if (Session["Appraisals"].ToString() == "true")
            {
                formFrame.Src = " ";
            }
        }
        protected void addAuctionForm_Click(object sender, EventArgs e)
        {

        }
    }
}