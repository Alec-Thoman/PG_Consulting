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
                "Street, City, State, ZipCode ) Values('@fn, @ln,@pt,@pn,@email,@pc,@id,@hear,@rs1,@rs2,@street,@city,@state,@zip)";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["InitialContact"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.Parameters.Add("@fn", SqlDbType.VarChar).Value = firstName;
            sqlCommand.Parameters.Add("@ln", SqlDbType.VarChar).Value = lastName;
            sqlCommand.Parameters.Add("@pt", SqlDbType.VarChar).Value = phoneType;
            sqlCommand.Parameters.Add("@pn", SqlDbType.VarChar).Value = phoneNumber;
            sqlCommand.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            sqlCommand.Parameters.Add("@pc", SqlDbType.VarChar).Value = preferredContact;
            sqlCommand.Parameters.Add("@id", SqlDbType.VarChar).Value = initialDate;
            sqlCommand.Parameters.Add("@hear", SqlDbType.VarChar).Value = hear;
            sqlCommand.Parameters.Add("@rs1", SqlDbType.VarChar).Value = requestedService1;
            sqlCommand.Parameters.Add("@rs2", SqlDbType.VarChar).Value = requestedService2;
            sqlCommand.Parameters.Add("@street", SqlDbType.VarChar).Value = street;
            sqlCommand.Parameters.Add("@city", SqlDbType.VarChar).Value = city;
            sqlCommand.Parameters.Add("@state", SqlDbType.VarChar).Value = state;
            sqlCommand.Parameters.Add("@zip", SqlDbType.Int).Value = zipcode;
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
