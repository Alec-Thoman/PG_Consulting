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
            
            String email = Session["UserName"].ToString();
            String uname = email.Substring(0, email.IndexOf("@"));

            nameTB.Text = uname;
            emailTB.Text = email;
            String phoneQuery = "select PhoneNumber from Customer where EmailAddress = '" + email + "'";
            SqlCommand cmd = new SqlCommand(phoneQuery, sqlConnect);
            string text = "";
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    text = (string)reader["PhoneNumber"];
                    
                }
            }
            pnTB.Text = text;
        }

    }
}