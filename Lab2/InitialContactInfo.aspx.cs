using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab2
{
    public partial class InitialContactInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String customerName = HttpUtility.HtmlEncode(txtCustomerName.Text).ToString();
            String address = HttpUtility.HtmlEncode(txtAddress.Text).ToString();
            String phoneNumber = HttpUtility.HtmlEncode(txtPhone.Text).ToString();
            String email = HttpUtility.HtmlEncode(txtEmail.Text).ToString();
            String contactWay = HttpUtility.HtmlEncode(DropDownList1.Text).ToString();
            String hear = HttpUtility.HtmlEncode(txtHearAbout.Text).ToString();
            
            
            String sqlQuery = "Insert INTO Customer(CustomerName, PhoneNumber,EmailAddress," +
                "CustomerAddress, contactWay, hearabout ) Values('" + customerName + "','" + phoneNumber + "','" + email + "','" + address + "','" + contactWay + "','" + hear + "')";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            queryResults.Close();
            sqlConnect.Close();
            
            Session["notes"] = HttpUtility.HtmlEncode(TextBox1.Text);
            Response.Redirect("ServiceEvent.aspx");
        }
    }
}
