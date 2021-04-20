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
    public partial class EditProfilePage : System.Web.UI.Page
    {
        private int custID = 7;
        string constr = "";
        protected void Page_Load()
        {

            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;

            // Reading db for values
            SqlConnection sqlConnect = new SqlConnection(constr);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = HttpUtility.HtmlEncode(Session["UserName"].ToString());
            }


            String customerQuery = "select CustomerID, CustomerAddress, PhoneNumber, EmailAddress, CustomerName from Customer where EmailAddress = @email";
            SqlCommand cmd = new SqlCommand(customerQuery, sqlConnect);
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            string pn = "";
            string address = "";
 
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    pn = HttpUtility.HtmlEncode((string)reader["PhoneNumber"]);
                    address = HttpUtility.HtmlEncode((string)reader["CustomerAddress"]);
                    //dbEmail = (string)reader["EmailAddress"];
                    uname = HttpUtility.HtmlEncode((string)reader["CustomerName"]);
                    this.custID = (int)reader["CustomerID"];

                }
            }
            if (!IsPostBack)
            {
                nameTB.Text = uname;
                //emailTB.Text = email;
                pnTB.Text = pn;
                addressTB.Text = address;
            }
           
            sqlConnect.Close();
        }

        protected void updateDB()
        {
            Page_Load();

            try
            {
                using (var connection = new SqlConnection(constr))
                {
                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandText = "UPDATE Customer SET CustomerAddress = @CustomerAddress," +
                                                "PhoneNumber = @PhoneNumber," +
                                                "CustomerName = @CustomerName" +
                                                " where CustomerID = @CustID";

                        command.Parameters.AddWithValue("@CustomerAddress", HttpUtility.HtmlEncode(addressTB.Text));
                        command.Parameters.AddWithValue("@PhoneNumber", HttpUtility.HtmlEncode(pnTB.Text));
                        command.Parameters.AddWithValue("@CustomerName", HttpUtility.HtmlEncode(nameTB.Text));
                        command.Parameters.AddWithValue("@CustID", custID);

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

        protected void cancelButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("CustomerProfile.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {

            updateDB();
            Response.Redirect("CustomerProfile.aspx");
            
            
        }
    }
}