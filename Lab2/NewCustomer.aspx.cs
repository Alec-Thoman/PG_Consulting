using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Lab2
{
    //Create By Yuhui AND Jocab 2/15/2021
    public partial class NewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {

                String customerName = HttpUtility.HtmlEncode(TextBox1.Text).ToString();
                String address = HttpUtility.HtmlEncode(TextBox3.Text).ToString();
                String phoneNumber = HttpUtility.HtmlEncode(TextBox7.Text).ToString();
                String email = HttpUtility.HtmlEncode(TextBox8.Text).ToString();
                String contactWay = HttpUtility.HtmlEncode(DropDownList1.Text).ToString();
                String hear = HttpUtility.HtmlEncode(TextBox2.Text).ToString();

                String sqlQuery = "Insert INTO Customer(CustomerName, PhoneNumber,EmailAddress," +
                    "CustomerAddress, contactWay, hearabout ) Values('" + customerName + "','" + phoneNumber + "','" + email + "','" + address + "','" + contactWay + "','" + hear + "')";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                queryResults.Close();
                sqlConnect.Close();
                sumbitDetail.Text = "Submit successfully";
                
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    System.Data.SqlClient.SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());
                    sc.Open();
                    sc1.Open();

                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc1;
                    // INSERT Customer RECORD
                    createUser.CommandText = "INSERT INTO Customer (CustomerName, PhoneNumber,EmailAddress," +
                    "CustomerAddress, contactWay, hearabout ) VALUES (@Name, @address, @phoneNumber,@email, @contactWay,@hear)";
                    createUser.Parameters.Add(new SqlParameter("@Name", TextBox1.Text));
                    createUser.Parameters.Add(new SqlParameter("@address", TextBox3.Text));
                    createUser.Parameters.Add(new SqlParameter("@phoneNumber", TextBox7.Text));
                    createUser.Parameters.Add(new SqlParameter("@email", TextBox8.Text));
                    createUser.Parameters.Add(new SqlParameter("@contactWay", DropDownList1.Text));
                    createUser.Parameters.Add(new SqlParameter("@hear", TextBox2.Text));
                    createUser.ExecuteNonQuery();
                    sc1.Close();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO CustomerUserInfo(Username, Password) VALUES (@Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", TextBox8.Text));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(TextBox4.Text))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    
                }
                catch
                {
                    sumbitDetail.Text = "Database Error - User not committed.";
                }
            }
            else
                sumbitDetail.Text = "Submit failed! Some required fields are empty.";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
            sumbitDetail.Text = "";

        }
        void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "Yuhui Li";
            TextBox3.Text = "865 East";
            TextBox7.Text = "5402469536";
            TextBox8.Text = "2020lyh@gmail.com";
            TextBox2.Text = "From Friends";
            TextBox4.Text = "123456";
            TextBox5.Text = TextBox8.Text;

        }


       

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLoginPageBStrap.aspx");
        }
    }
}