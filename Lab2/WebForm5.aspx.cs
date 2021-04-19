using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("SELECT 'Move' as [Service Type], Preliminary.MoveOutDate as [Date of Service] From InitialInfo INNER JOIN MoveAssessment on MoveAssessment.InitialInfoID = InitialInfo.InitialInfoID INNER JOIN" +
                " Preliminary on Preliminary.MoveID = MoveAssessment.MoveID where Preliminary.MoveOutDate LIKE '04%' UNION" +
                " SELECT 'Auction' as [Service Type], Assessment.DateCreated as [Date of Service] From Assessment INNER JOIN AuctionAssessment ON AuctionAssessment.AuctionID = Assessment.AuctionID INNER JOIN InitialInfo on" +
                " InitialInfo.InitialInfoID = AuctionAssessment.InitialInfoID where Assessment.DateCreated LIKE '04%' UNION" +

                " SELECT 'LookAt' as [Service Type], AuctionLookAtEvent.Date as [Date of Service] From AuctionLookAtEvent INNER JOIN InitialInfo ON InitialInfo.InitialInfoID = AuctionLookAtEvent.InitialInfoID where AuctionLookAtEvent.Date LIKE '04%'" +

                " UNION SELECT 'Appraisal' as [Service Type], AppraisalServiceInvoice.AppraisalDate as [Date of Service] From AppraisalServiceInvoice where AppraisalServiceInvoice.AppraisalDate LIKE '04%' UNION SELECT 'Move Assessment'" +
                " as [Service Type], SUBSTRING(Preliminary.MovingWindow, 1, 10) as [Date of Service] From Preliminary INNER JOIN MoveAssessment on Preliminary.MoveID = MoveAssessment.MoveID where SUBSTRING(Preliminary.MovingWindow, 1, 10) LIKE '04%' UNION" +

                " SELECT 'Auction Assessment' as [Service Type], Assessment.DateCreated as [Date of Service] From Assessment where Assessment.DateCreated LIKE '04%'", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            servicesGridview.DataSource = dt;
            servicesGridview.DataBind();
        }
    }
}