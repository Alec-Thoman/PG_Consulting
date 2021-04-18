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
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DBSource"].Equals("AWS"))
            {
                constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            }
            else
            {
                constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            }
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
            String deadline = HttpUtility.HtmlEncode(txtDeadline.Text).ToString();
            String hear = HttpUtility.HtmlEncode(txtHearAbout.Text).ToString();
            String requestedService1 = HttpUtility.HtmlEncode(CheckBoxList1.Text).ToString();
            String street = HttpUtility.HtmlEncode(txtStreet.Text).ToString();
            String city = HttpUtility.HtmlEncode(txtCity.Text).ToString();
            String state = HttpUtility.HtmlEncode(txtState.Text).ToString();
            String zipcode = HttpUtility.HtmlEncode(txtZipcode.Text).ToString();
            String notes = HttpUtility.HtmlEncode(txtNotes.Text).ToString();
            
            
            String sqlInitial = "Insert INTO InitialInfo(FirstName, LastName, PhoneType, PhoneNumber, Email, PreferredContact, InitialDate, Deadline, HearAboutUs, RequestedService, " +
                "Street, City, State, ZipCode ) Values(@fn,@ln,@pt,@pn,@email,@pc,@id, @dl,@hear,@rs1,@street,@city,@state,@zip);SELECT CAST(scope_identity() AS int)";

            String sqlNote = "Insert INTO Notes(NoteBody, InitialInfoID) Values(@note,@InitialInfoID)";

            int initialInfoID = 0;
            using (SqlConnection sqlConnect = new SqlConnection(constr))
            {
                using (SqlCommand command = new SqlCommand(sqlInitial, sqlConnect))
                {
                    sqlConnect.Open();
                    command.CommandType = CommandType.Text;
                    command.Parameters.Add("@fn", SqlDbType.VarChar).Value = firstName;
                    command.Parameters.Add("@ln", SqlDbType.VarChar).Value = lastName;
                    command.Parameters.Add("@pt", SqlDbType.VarChar).Value = phoneType;
                    command.Parameters.Add("@pn", SqlDbType.VarChar).Value = phoneNumber;
                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                    command.Parameters.Add("@pc", SqlDbType.VarChar).Value = preferredContact;
                    command.Parameters.Add("@id", SqlDbType.VarChar).Value = initialDate;
                    command.Parameters.Add("@dl", SqlDbType.VarChar).Value = deadline;
                    command.Parameters.Add("@hear", SqlDbType.VarChar).Value = hear;
                    command.Parameters.Add("@rs1", SqlDbType.VarChar).Value = requestedService1;
                    command.Parameters.Add("@street", SqlDbType.VarChar).Value = street;
                    command.Parameters.Add("@city", SqlDbType.VarChar).Value = city;
                    command.Parameters.Add("@state", SqlDbType.VarChar).Value = state;
                    command.Parameters.Add("@zip", SqlDbType.Int).Value = zipcode;
                    //command.ExecuteNonQuery();
                    initialInfoID = (int)command.ExecuteScalar();

                    sqlConnect.Close();
                }

                using (SqlCommand command2 = new SqlCommand(sqlNote, sqlConnect))
                {
                    sqlConnect.Open();
                    command2.Parameters.Add("@note", SqlDbType.VarChar).Value = notes;
                    command2.Parameters.Add("@InitialInfoID", SqlDbType.Int).Value = initialInfoID;

                    command2.ExecuteNonQuery();
                    //SqlDataReader queryResults = command.ExecuteReader();
                    //queryResults.Close();
                    sqlConnect.Close();
                }
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewestEmployeeHomePage.aspx");
        }
    }
}
