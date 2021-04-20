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
    public partial class CustomerProfile : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;

            SqlConnection sqlConnect = new SqlConnection(constr);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = HttpUtility.HtmlEncode(Session["UserName"].ToString());
            }

            String phoneandAddressQuery = "select CustomerName, CustomerAddress, PhoneNumber from Customer where EmailAddress = @email";
            SqlCommand cmd = new SqlCommand(phoneandAddressQuery, sqlConnect);
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
                    uname = HttpUtility.HtmlEncode((string)reader["CustomerName"]);
                }
            }
            pnTB.Text = pn;
            addressTB.Text = address;
            nameTB.Text = uname;
        }

    }
}