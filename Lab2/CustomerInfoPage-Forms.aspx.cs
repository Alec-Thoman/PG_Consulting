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


            Session["InitialInfoID"] = 1;

            //Session["OrderForm"] = "";
            //Session["CompletionForm"] = "";
            //Session["AppraisalForm"] = "";
            //Session["LookAtForm"] = "";
            //Session["AssessmentForm"] = "";

            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;

            SqlConnection sqlConnect = new SqlConnection(constr);
            sqlConnect.Open();
            string notesQuery = "Select  NoteBody FROM Notes WHERE InitialInfoID = " + Session["InitialInfoID"];
            SqlCommand cmd = new SqlCommand(notesQuery, sqlConnect);
            if (cmd.ExecuteScalar() != null)
            {
                notesTA.Value = cmd.ExecuteScalar().ToString();
                

            }
            string initialInfoQuery = "select FirstName, LastName, InitialDate from InitialInfo where InitialInfoID = @ID";
            string fn = "";
            string ln = "";
            string initDate = "";
            cmd = new SqlCommand(initialInfoQuery, sqlConnect);
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(Session["InitialInfoID"]);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    fn = (string)reader["FirstName"];
                    ln = (string)reader["LastName"];
                    initDate = (string)reader["InitialDate"];
                }
            }
            namelbl.Text = fn + " " + ln;
            createDatelbl.Text = "Created Account: " + initDate;
        }
        protected void order_Click(object sender, EventArgs e)
        {
            ((BoundField)formsGridView.Columns[1]).DataField = "Service Type";
            ((BoundField)formsGridView.Columns[2]).DataField = "Date Created";
            ((BoundField)formsGridView.Columns[3]).DataField = "Date of Service";


            formsGridView.Columns[3].Visible = true;


            addForm.Visible = false;
            addMoveForm.Visible = true;
            addAuctionForm.Visible = true;
            formFrame.Visible = false;
            formsGridView.Visible = true;



            Session["OrderForm"] = "true";
            Session["CompletionForm"] = "false";
            Session["AppraisalForm"] = "false";
            Session["LookAtForm"] = "false";
            Session["AssessmentForm"] = "false";



            formsGridView.DataSource = null;
            formsGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);

            String sqlMain = "SELECT serviceTicket.ServiceTicketID as [ID], Service.ServiceType as [Service Type], serviceTicket.TicketBeginDate as [Date Created], serviceTicket.Deadline as [Date of Service] From Service INNER JOIN serviceTicket on serviceTicket.ServiceID = Service.ServiceID INNER JOIN InitialInfo on InitialInfo.InitialInfoID = serviceTicket.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(formsGridView, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";

                if (Session["LookAtForm"] == "true")
                {
                    formsGridView.HeaderRow.Cells[1].Text = "Date";
                    formsGridView.HeaderRow.Cells[2].Text = "Supplies Needed";
                }
                else if (Session["AssessmentForm"] == "true")
                {
                    formsGridView.HeaderRow.Cells[1].Text = "Service Type";
                    formsGridView.HeaderRow.Cells[2].Text = "Date Created";
                    formsGridView.HeaderRow.Cells[3].Text = "Date of Service";
                }
                else if (Session["AppraisalForm"] == "true")
                {
                    formsGridView.HeaderRow.Cells[1].Text = "Contact Name";
                    formsGridView.HeaderRow.Cells[2].Text = "Send Appraisal Address";
                    formsGridView.HeaderRow.Cells[3].Text = "Appraisal Date";
                }
                else if (Session["OrderForm"] == "true")
                {
                    formsGridView.HeaderRow.Cells[1].Text = "Service Type";
                    formsGridView.HeaderRow.Cells[2].Text = "Date Created";
                    formsGridView.HeaderRow.Cells[3].Text = "Date of Service";
                }



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

                    System.Diagnostics.Debug.WriteLine(formsGridView.DataKeys[row.RowIndex].Values["Id"]);
                    formFrame.Visible = true;
                    Session["IsForm"] = "true";
                    if (Session["AssessmentForm"].ToString() == "true")
                    {
                        if (formsGridView.SelectedRow.Cells[1].Text == "Move")
                        {
                            Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                            tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                            formFrame.Src = "MoveAssessment.aspx";
                        }
                        else
                        {
                            Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                            tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                            formFrame.Src = "AuctionAssessment.aspx";
                        }
                    }
                    else if (Session["LookAtForm"].ToString() == "true")
                    {
                        formFrame.Src = "AuctionLookAt.aspx";
                        tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                        Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                    }
                    else if (Session["AppraisalForm"].ToString() == "true")
                    {
                        formFrame.Src = "AppraisalServiceOrder.aspx";
                        tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                        Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                    }
                    else if (Session["OrderForm"].ToString() == "true")
                    {
                        if (formsGridView.SelectedRow.Cells[1].Text == "Move")
                        {
                            Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                            tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                            formFrame.Src = " ";
                        }
                        else
                        {
                            Session["FormID"] = formsGridView.DataKeys[row.RowIndex].Values["Id"];
                            tester.Text = formsGridView.DataKeys[row.RowIndex].Values["Id"].ToString();
                            formFrame.Src = "AuctionOrder.aspx";
                        }
                    }

                    sqlConnect.Close();


                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
        protected void appraisals_Click(object sender, EventArgs e)
        {
            ((BoundField)formsGridView.Columns[1]).DataField = "Contact Name";
            ((BoundField)formsGridView.Columns[2]).DataField = "Address to Send";
            ((BoundField)formsGridView.Columns[3]).DataField = "Date of Appraisal";


            formsGridView.Columns[3].Visible = true;


            addForm.Visible = true;
            addMoveForm.Visible = false;
            addAuctionForm.Visible = false;
            formFrame.Visible = false;
            formsGridView.Visible = true;



            Session["OrderForm"] = "false";
            Session["CompletionForm"] = "false";
            Session["AppraisalForm"] = "true";
            Session["LookAtForm"] = "false";
            Session["AssessmentForm"] = "false";



            formsGridView.DataSource = null;
            formsGridView.DataBind();
            SqlConnection sqlConnect = new SqlConnection(constr);

            String sqlMain = "SELECT AppraisalServiceInvoice.AppraisalServiceInvoiceID as [ID], AppraisalServiceInvoice.ContactName as [Contact Name],AppraisalServiceInvoice.SendAppraisalAddress as [Address to Send], AppraisalServiceInvoice.AppraisalDate as [Date of Appraisal] FROM AppraisalServiceInvoice INNER JOIN InitialInfo on InitialInfo.InitialInfoID = AppraisalServiceInvoice.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
        }
        protected void assessments_Click(object sender, EventArgs e)
        {



            ((BoundField)formsGridView.Columns[1]).DataField = "Service Type";
            ((BoundField)formsGridView.Columns[2]).DataField = "Date Created";
            ((BoundField)formsGridView.Columns[3]).DataField = "Date of Service";


            formsGridView.Columns[3].Visible = true;


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

            String sqlMain = "SELECT Preliminary.MoveID as [ID], 'Move' as [Service Type], Preliminary.DateCreated as [Date Created], Preliminary.MoveOutDate as [Date of Service] From InitialInfo INNER JOIN MoveAssessment on MoveAssessment.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN " +
                "Preliminary on Preliminary.MoveID = MoveAssessment.MoveID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString() + " UNION " +
                "SELECT AuctionAssessment.AuctionID as [ID], 'Auction' as [Service Type], Assessment.DateCreated as [Date Created], Assessment.Deadline as [Date of Service] From Assessment INNER JOIN AuctionAssessment ON AuctionAssessment.AuctionID = Assessment.AuctionID INNER JOIN InitialInfo on " +
                "InitialInfo.InitialInfoID = AuctionAssessment.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();



        }
        protected void lookAt_Click(object sender, EventArgs e)
        {

            ((BoundField)formsGridView.Columns[1]).DataField = "Date";
            ((BoundField)formsGridView.Columns[2]).DataField = "SuppliesNeeded";

            //formsGridView.Columns[0].Visible = false;
            formsGridView.Columns[3].Visible = false;

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




            //formsGridView.HeaderRow.Cells[0].Text = "Date";

            System.Diagnostics.Debug.WriteLine("fml");

            formsGridView.DataSource = null;
            formsGridView.DataBind();


            SqlConnection sqlConnect = new SqlConnection(constr);

            String sqlMain = "SELECT AuctionLookAtEvent.AuctionLookAtID as [ID], AuctionLookAtEvent.Date as [Date], AuctionLookAtEvent.SuppliesNeeded as [SuppliesNeeded] FROM AuctionLookAtEvent INNER JOIN InitialInfo on InitialInfo.InitialInfoID = AuctionLookAtEvent.InitialInfoID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
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


            if (Session["CompletionForm"].ToString() == "true")
            {
                formFrame.Src = " ";
            }
            else if (Session["AppraisalForm"].ToString() == "true")
            {
                formFrame.Src = "AppraisalServiceOrder.aspx";
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
            else if (Session["OrderForm"].ToString() == "true")
            {
                formFrame.Src = "MoveOrder.aspx";
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
                formFrame.Src = "AuctionOrder.aspx";
            }
        }
        protected void notesSave_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(constr);
            sqlConnect.Open();
            String sqlUpdate = "UPDATE Notes SET NoteBody = '" + notesTA.Value + "' WHERE InitialInfoID = '" + Session["InitialInfoID"] + "'";
            //SqlCommand updater = new SqlCommand(sqlUpdate, sqlConnect);
            System.Diagnostics.Debug.WriteLine(sqlUpdate);
            System.Diagnostics.Debug.WriteLine("testing");

           


            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlUpdate;
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            queryResults.Close();
            sqlConnect.Close();
        }
    }
}