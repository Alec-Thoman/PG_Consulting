using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Lab2
{
    public partial class EmployeeNewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {

                String customerName = HttpUtility.HtmlEncode(nameTxt.Value).ToString();
                String address = HttpUtility.HtmlEncode(addressTxt.Value).ToString();
                String phoneNumber = HttpUtility.HtmlEncode(phoneTxt.Value).ToString();
                String email = HttpUtility.HtmlEncode(emailTxt.Value).ToString();
                String contactWay = HttpUtility.HtmlEncode(DropDownList1.Text).ToString();
                String hear = HttpUtility.HtmlEncode(hearAboutTxt.Value).ToString();

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
                submitDetail.InnerText = "Submit successfully";

                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    sc.Open();
                    System.Diagnostics.Debug.WriteLine("P1");
                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    System.Diagnostics.Debug.WriteLine("P1");
                    setPass.Connection = sc;
                    System.Diagnostics.Debug.WriteLine("P1");
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO CustomerUserInfo(Username, Password) VALUES (@Username, @Password)";
                    System.Diagnostics.Debug.WriteLine("P1");
                    setPass.Parameters.Add(new SqlParameter("@Username", emailTxt.Value));
                    System.Diagnostics.Debug.WriteLine("P1");
                    setPass.Parameters.Add(new SqlParameter("@Password", passwordTxt.Value));
                    System.Diagnostics.Debug.WriteLine("P1");
                    setPass.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine("P1");
                    sc.Close();
                    System.Diagnostics.Debug.WriteLine("P1");

                }
                catch
                {
                    submitDetail.InnerText = "Database Error - User not committed.";
                }
            }
            else
                submitDetail.InnerText = "Submit failed! Some required fields are empty.";

        }
        protected void populate_Click(object sender, EventArgs e)
        {
            nameTxt.Value = "Brad Shaw";
            addressTxt.Value = "1580 Morris Lane Harrisonburg VA 22801";
            phoneTxt.Value = "2024512098";
            emailTxt.Value = "bshaw@gmail.com";
            passwordTxt.Value = "bradleyshaw309";
            hearAboutTxt.Value = "Facebook";
        }
    }
}