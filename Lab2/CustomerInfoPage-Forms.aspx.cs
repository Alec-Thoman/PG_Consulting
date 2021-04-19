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
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (SqlConnection testConn = new SqlConnection(constr))
            //{
            //    if (!testConn.IsAvailable())
            //    {
            //        constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                    
            //    }
            //}

            Session["InitialInfoID"] = 1;
            //Session["OrderForm"] = "";
            //Session["CompletionForm"] = "";
            //Session["AppraisalForm"] = "";
            //Session["LookAtForm"] = "";
            //Session["AssessmentForm"] = "";

            //if (Session["DBSource"].Equals("AWS"))
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //}
            //else
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}
            constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
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

                System.Diagnostics.Debug.WriteLine(formsGridView.DataKeys[e.Row.RowIndex]["Outlook_ID"]);
                System.Diagnostics.Debug.WriteLine("fml");


            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in formsGridView.Rows)
            {
                if (row.RowIndex == formsGridView.SelectedIndex)
                {
                    SqlConnection sqlConnect = new SqlConnection(constr);
                    sqlConnect.Open();

                    row.BackColor = ColorTranslator.FromHtml("#9dbdb9");
                    row.ToolTip = string.Empty;

                    //formFrame.Visible = true;
                    //Session["IsForm"] = "true";
                    //if (Session["AssessmentForm"].ToString() == "true")
                    //{
                    //    if(formsGridView.SelectedRow.Cells[0].Text == "Move")
                    //    {
                    //        formFrame.Src = "MoveAssessment.aspx";
                    //    }
                    //    else
                    //    {
                    //        formFrame.Src = "AuctionAssessment.aspx";
                    //    }
                    //}

                    


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
            addForm.Visible = false;
            addMoveForm.Visible = true;
            addAuctionForm.Visible = true;
            formFrame.Visible = false;
            formsGridView.Visible = true; 

            Session["OrderForm"] = "false";
            Session["CompletionForm"] = "false";
            Session["AppraisalForm"] = "false";
            Session["LookAtForm"] = "false";
            Session["AssessmentForm"] = "true";

            formsGridView.DataSource = null;
            formsGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);

            String sqlMain = "SELECT 'Move' as [Service Type], Preliminary.DateCreated as [Date Created], Preliminary.MoveOutDate as [Date of Service] From InitialInfo INNER JOIN MoveAssessment on MoveAssessment.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN " +
                "Preliminary on Preliminary.MoveID = MoveAssessment.MoveID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString() + " UNION "+
                "SELECT 'Auction' as [Service Type], Assessment.DateCreated as [Date Created], Assessment.Deadline as [Date of Service] From Assessment INNER JOIN AuctionAssessment ON AuctionAssessment.AuctionID = Assessment.AuctionID INNER JOIN InitialInfo on "+
                "InitialInfo.InitialInfoID = AuctionAssessment.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
            System.Diagnostics.Debug.WriteLine(Session["AssessmentForm"].ToString());

        }
        protected void lookAt_Click(object sender, EventArgs e)
        {
            addForm.Visible = true;
            addMoveForm.Visible = false;
            addAuctionForm.Visible = false;
            formFrame.Visible = false;
            formsGridView.Visible = true;

            Session["OrderForm"] = "false";
            Session["CompletionForm"] = "false";
            Session["AppraisalForm"] = "false";
            Session["LookAtForm"] = "true";
            Session["AssessmentForm"] = "false";

            formsGridView.DataSource = null;
            formsGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);

            String sqlMain = "SELECT AuctionLookAtEvent.Date, AuctionLookAtEvent.SuppliesNeeded FROM AuctionLookAtEvent INNER JOIN InitialInfo on InitialInfo.InitialInfoID = AuctionLookAtEvent.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
            

        }
        protected void addForm_Click(object sender, EventArgs e)
        {
            formsGridView.Visible = false;
            formFrame.Visible = true;
            Session["IsForm"] = "false";
            
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
            else if (Session["LookAtForm"].ToString() == "true")
            {
                formFrame.Src = "AuctionLookAt.aspx";
            }
        }
        protected void addMoveForm_Click(object sender, EventArgs e)
        {
            formsGridView.Visible = false;
            formFrame.Visible = true;
            //formFrame.Src = "MoveAssessment.aspx";
            Session["IsForm"] = "false";
            System.Diagnostics.Debug.WriteLine(Session["AssessmentForm"].ToString());
            if (Session["AssessmentForm"].ToString() == "true")
            {
                formFrame.Src = "MoveAssessment.aspx";
            }
            else if (Session["OrderForm"].ToString() == "true"){
                formFrame.Src = "";
            }
        }
        protected void addAuctionForm_Click(object sender, EventArgs e)
        {
            formsGridView.Visible = false;
            formFrame.Visible = true;
            //formFrame.Src = "AuctionAssessment.aspx";
            Session["IsForm"] = "false";
            if (Session["AssessmentForm"].ToString() == "true")
            {
                formFrame.Src = "AuctionAssessment.aspx";
            }
            else if (Session["OrderForm"].ToString() == "true")
            {
                formFrame.Src = "";
            }
        }
    }
}