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
    public partial class WebForm7 : System.Web.UI.Page
    {
        int initialInfoID = 1;
        string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //int initialInfoID = 1;
            string initDate = "";
            string fn = "";
            string ln = "";
            if (Session["InitialInfoID"] != null)
            {
                initialInfoID = Convert.ToInt32(Session["InitialInfoID"]);
            }

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
            string initialInfoQuery = "select FirstName, LastName, Email, PhoneNumber, InitialDate, Street, City, State, ZipCode from InitialInfo where InitialInfoID = @ID";

            SqlCommand cmd = new SqlCommand(initialInfoQuery, sqlConnect);
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = initialInfoID;
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    if (!IsPostBack)
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
                    //initDate = (string)reader["InitialDate"];
                }
            }
            namelbl.Text = fn + " " + ln;
            createDatelbl.Text = "Created Account: " + initDate;
        }

        protected void updateDB()
        {
            //Page_Load();

            //using (SqlConnection connection =
            //  new SqlConnection(connectionString))
            //{
            //SqlCommand cmd = new SqlCommand(
            //  "select CustomerAddress, PhoneNumber, EmailAddress, CustomerName from Customer where EmailAddress = '" + email + "'",
            //  connection);
            //connection.Open();
            //var sql =
            //   "UPDATE Customer SET CustomerAddress = @CustomerAddress," +
            //   "PhoneNumber = @PhoneNumber," +
            //   "EmailAddress = @EmailAddress," +
            //   "CustomerName = @CustomerName" +
            //   " where CustomerID = @CustID";

            //    //SqlCommand cmd = new SqlCommand(
            //    //   "UPDATE Customer SET CustomerAddress = '" + addressTB.Text + "'" + "," +
            //    //   "PhoneNumber = '" + pnTB.Text + "'" + "," +
            //    //   "EmailAddress = '" + emailTB.Text + "'" + "," +
            //    //   "CustomerName = '" + nameTB.Text + "'" +
            //    //   " where CustomerID = " + custID,
            //    //   connection);

            //    cmd.Parameters.AddWithValue(
            //       "@CustomerAddress", addressTB.Text);

            //    cmd.Parameters.AddWithValue(
            //        "@PhoneNumber", pnTB.Text);

            //    cmd.Parameters.AddWithValue(
            //        "@EmailAddress", emailTB.Text);

            //    cmd.Parameters.AddWithValue(
            //        "@CustomerName", nameTB.Text);

            //    cmd.ExecuteNonQuery();

            //    connection.Close();
            //}

            try
            {
                using (var connection = new SqlConnection(constr))
                {
                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandText = "UPDATE InitialInfo SET FirstName = @FirstName," +
                                                "LastName = @LastName," +
                                                "Email = @Email," + " PhoneNumber = @PhoneNumber," +
                                                " Street = @Street," + " City = @City," + " State = @State," +
                                                " ZipCode = @ZipCode" +
                                                " where InitialInfoID = @ID";

                        command.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(fnTB.Text));
                        command.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(lnTB.Text));
                        command.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(emailTB.Text));
                        command.Parameters.AddWithValue("@PhoneNumber", HttpUtility.HtmlEncode(phoneTB.Text));
                        command.Parameters.AddWithValue("@Street", HttpUtility.HtmlEncode(addressTB.Text));
                        command.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(cityTB.Text));
                        command.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(stateTB.Text));
                        command.Parameters.AddWithValue("@ZipCode", HttpUtility.HtmlEncode(zipTB.Text));
                        command.Parameters.AddWithValue("@ID", initialInfoID);

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception e)
            {
                //MessageBox.Show($"Failed to update. Error message: {e.Message}");
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            updateDB();
            Response.Redirect("CustomerInfoPage.aspx");
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerInfoPage.aspx");
        }
    }
}