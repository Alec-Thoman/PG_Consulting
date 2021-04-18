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
    public partial class EmployeeProfile : System.Web.UI.Page
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
            SqlConnection sqlConnect = new SqlConnection(constr);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = HttpUtility.HtmlEncode(Session["UserName"].ToString());
                //uname = email.Substring(0, email.IndexOf("@"));
            }

            //nameTB.Text = uname;
            //emailTB.Text = email;
            String employeeQuery = "select EmployeeName, Position, CellNumber from employee where EmailAddress = @email";
            SqlCommand cmd = new SqlCommand(employeeQuery, sqlConnect);
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            string pn = "";
            string position = "";
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    pn = HttpUtility.HtmlEncode((string)reader["CellNumber"]);
                    position = HttpUtility.HtmlEncode((string)reader["Position"]);
                    uname = HttpUtility.HtmlEncode((string)reader["EmployeeName"]);
                }
            }
            pnTB.Text = pn;
            positionTB.Text = position;
            nameTB.Text = uname;
        }
    }
}