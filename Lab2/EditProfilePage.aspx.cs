﻿using System;
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
        protected void Page_Load()
        {
            // Reading db for values
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = Session["UserName"].ToString();
                //uname = email.Substring(0, email.IndexOf("@"));
            }

            //nameTB.Text = uname;
            //emailTB.Text = email;

            String customerQuery = "select CustomerID, CustomerAddress, PhoneNumber, EmailAddress, CustomerName from Customer where EmailAddress = '" + email + "'";
            SqlCommand cmd = new SqlCommand(customerQuery, sqlConnect);
            string pn = "";
            string address = "";
            //string dbEmail = "";
            //string name = "";
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    pn = (string)reader["PhoneNumber"];
                    address = (string)reader["CustomerAddress"];
                    //dbEmail = (string)reader["EmailAddress"];
                    uname = (string)reader["CustomerName"];
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
            //pnTB.Text = pn;
            //addressTB.Text = address;
            sqlConnect.Close();
        }

        protected void updateDB()
        {
            Page_Load();

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
                using (var connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString))
                {
                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandText = "UPDATE Customer SET CustomerAddress = @CustomerAddress," +
                                                "PhoneNumber = @PhoneNumber," +
                                                "CustomerName = @CustomerName" +
                                                " where CustomerID = @CustID";

                        command.Parameters.AddWithValue("@CustomerAddress", addressTB.Text);
                        command.Parameters.AddWithValue("@PhoneNumber", pnTB.Text);
                        //command.Parameters.AddWithValue("@EmailAddress", emailTB.Text);
                        command.Parameters.AddWithValue("@CustomerName", nameTB.Text);
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
            
           //DataRow row = ClientIDSeparat
            
        }
    }
}