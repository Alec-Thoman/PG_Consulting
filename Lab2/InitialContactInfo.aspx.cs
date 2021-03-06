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
            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;

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
                    sqlConnect.Close();
                }
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                sc.Open();
                System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                setPass.Connection = sc;
                // INSERT PASSWORD RECORD AND CONNECT TO USER
                setPass.CommandText = "INSERT INTO CustomerUserInfo (Username, Password) VALUES (@Username, @Password)";
                setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtEmail.Text).ToString()));
                setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(HttpUtility.HtmlEncode(txtPassword.Text).ToString()))); // hash entered password
                setPass.ExecuteNonQuery();
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewestEmployeeHomePage.aspx");
        }

        protected void popButton_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "Jimmy";
            txtLastName.Text = "Dukes";
            ddlPhoneType.SelectedIndex = 1;
            txtPhone.Text = "804-125-4563";
            txtEmail.Text = "jmu@dukes.edu";
            ddlPreferredContact.SelectedIndex = 2;
            txtInitialDate.TextMode = TextBoxMode.SingleLine;
            txtDeadline.TextMode = TextBoxMode.SingleLine;
            txtInitialDate.Text = "04/24/2021";
            txtDeadline.Text = "06/09/2021";
            txtHearAbout.Text = "From a friend";
            CheckBoxList1.Items[1].Selected = true;
            txtStreet.Text = "5312 Dukes Place";
            txtCity.Text = "Harrisonburg";
            txtState.Text = "VA";
            txtZipcode.Text = "22801";
            txtNotes.Text = "Very chatty\nHas 2 dogs\nheard about us through a friend";
            Page_Load(sender, e);

        }
    }
}
