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
            String firstName = HttpUtility.HtmlEncode(txtFirstName.Text).ToString();
            String lastName = HttpUtility.HtmlEncode(txtLastName.Text).ToString();
            String phoneType = HttpUtility.HtmlEncode(ddlPhoneType.Text).ToString();
            String phoneNumber = HttpUtility.HtmlEncode(txtPhone.Text).ToString();
            String email = HttpUtility.HtmlEncode(txtEmail.Text).ToString();
            String preferredContact = HttpUtility.HtmlEncode(ddlPreferredContact.Text).ToString();
            String initialDate = HttpUtility.HtmlEncode(txtInitialDate.Text).ToString();
            String hear = HttpUtility.HtmlEncode(txtHearAbout.Text).ToString();
            String requestedService1 = HttpUtility.HtmlEncode(CheckBoxList1.Text).ToString();
            String requestedService2 = HttpUtility.HtmlEncode(CheckBoxList2.Text).ToString();
            String street = HttpUtility.HtmlEncode(txtStreet.Text).ToString();
            String city = HttpUtility.HtmlEncode(txtCity.Text).ToString();
            String state = HttpUtility.HtmlEncode(txtState.Text).ToString();
            String zipcode = HttpUtility.HtmlEncode(txtZipcode.Text).ToString();
            //String hear = HttpUtility.HtmlEncode(txtHearAbout.Text).ToString();
            
            
            String sqlQuery = "Insert INTO InitialInfo(FistName, LastName, PhoneType, PhoneNumber, Email, PreferredContact, InitialDate, HearAboutUs, RequestedService, " +
                "Street, City, State, ZipCode ) Values('" + firstName + "','" + lastName + "','" + phoneType + "','" + phoneNumber + "','" + email + "','" + preferredContact + "','" + initialDate + "','" + hear + "','" + requestedService1 + "','" + requestedService2 + "','" + street + "','" + city + "','" + state + "','" + zipcode + "')";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["InitialContact"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            queryResults.Close();
            sqlConnect.Close();
            
            Session["notes"] = HttpUtility.HtmlEncode(txtNotes.Text);
            Response.Redirect("ServiceEvent.aspx");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePageBStrap.aspx");
        }
    }
}
