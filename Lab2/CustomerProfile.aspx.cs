using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = Session["UserName"].ToString();
                uname = email.Substring(0, email.IndexOf("@"));
            }

            nameTB.Text = uname;
            emailTB.Text = email;
            String phoneandAddressQuery = "select CustomerAddress, PhoneNumber from Customer where EmailAddress = '" + email + "'";
            //String addressQuery = "select CustomerAddress from Customer where EmailAddress = '" + email + "'";
            SqlCommand cmd = new SqlCommand(phoneandAddressQuery, sqlConnect);
            string pn = "";
            string address = "";
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    pn = (string)reader["PhoneNumber"];
                    address = (string)reader["CustomerAddress"];
                }
            }
            pnTB.Text = pn;
            addressTB.Text = address;
        }

    }
}