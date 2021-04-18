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
    public partial class CustomerInfoPage : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fn = "";
            string ln = "";
            string initDate = "";
            int initialInfoID = Convert.ToInt32(Session["InitialInfoID"]);
            if (Session["InitialInfoID"] != null)
            {
                initialInfoID = Convert.ToInt32(Session["InitialInfoID"]);
            }

            //if (Session["DBSource"].Equals("AWS"))
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //}
            //else
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}
            constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            SqlConnection sqlConnect = new SqlConnection(constr);
            string initialInfoQuery = "select FirstName, LastName, Email, InitialDate, PhoneNumber, Street, City, State, ZipCode from InitialInfo where InitialInfoID = @ID";

            SqlCommand cmd = new SqlCommand(initialInfoQuery, sqlConnect);
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = initialInfoID;
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    fnTB.Text = HttpUtility.HtmlEncode((string)reader["FirstName"]);
                    lnTB.Text = HttpUtility.HtmlEncode((string)reader["LastName"]);
                    fn = (string)reader["FirstName"];
                    ln = (string)reader["LastName"];
                    emailTB.Text = HttpUtility.HtmlEncode((string)reader["Email"]);
                    phoneTB.Text = HttpUtility.HtmlEncode((string)reader["PhoneNumber"]);
                    addressTB.Text = HttpUtility.HtmlEncode((string)reader["Street"]);
                    cityTB.Text = HttpUtility.HtmlEncode((string)reader["City"]);
                    stateTB.Text = HttpUtility.HtmlEncode((string)reader["State"]);
                    zipTB.Text = Convert.ToInt32(reader["ZipCode"]) + "";
                    initDate = (string)reader["InitialDate"];
                }
            }
            namelbl.Text = fn + " " + ln;
            createDatelbl.Text = "Created Account: " + initDate;
        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerInfoEditPage.aspx");
        }
    }
}