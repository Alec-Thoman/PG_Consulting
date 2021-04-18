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
        string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // test if aws connection is open & available
            using (SqlConnection testConn = new SqlConnection(constr))
            {
                if (!testConn.IsAvailable())
                {
                    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                    //isAWS = false;
                }
            }
        }
        protected void order_Click(object sender, EventArgs e)
        {
            
        }
        protected void assessments_Click(object sender, EventArgs e)
        {
            formsGridView.DataSource = null;
            formsGridView.DataBind();

            SqlConnection sqlConnect = new SqlConnection(constr);


            String sqlMain = "SELECT Service.ServiceType as [Service], serviceTicket.TicketStatus as [Status], serviceTicket.TicketBeginDate as [Date Created], serviceTicket.Deadline as [Date of Service] FROM InitialInfo INNER JOIN serviceTicket on serviceTicket.InitialInfoID = InitialInfo.InitialInfoID" +
                " INNER JOIN Service on Service.ServiceID = serviceTicket.ServiceID WHERE InitialInfo.InitialInfoID =" + Session["InitialInfoID"].ToString();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlMain, sqlConnect);

            DataTable formsGrid = new DataTable();

            sqlAdapter.Fill(formsGrid);
            formsGridView.DataSource = formsGrid;
            formsGridView.DataBind();
        }
    }
}