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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;

            if (Request.QueryString.Get("loggedout") == "true")
            {
                Label loginMessage = new Label();
                loginMessage.Text = "User has successfully logged out";
                this.Controls.Add(loginMessage);
            }

            if (Session["InvalidUse"] != null)
            {
                Label loginMessage = new Label();
                loginMessage.Text = HttpUtility.HtmlEncode(Session["InvalidUse"].ToString());
                this.Controls.Add(loginMessage);
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            try
            {
                
                SqlConnection sc = new SqlConnection(constr);
                

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;

                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT Password FROM CustomerUserInfo WHERE Username = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(emailTB.Text.ToString())));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["Password"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(passwordTB.Text.ToString()), storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            Session["UserName"] = HttpUtility.HtmlEncode(emailTB.Text.ToString());
                            
                            loginButton.Enabled = false;
                            emailTB.Enabled = false;
                            passwordTB.Enabled = false;
                            Response.Redirect("CustomerHomePageBStrap.aspx");
                        }
                        else
                        {
                            Label loginMessage = new Label();
                            loginMessage.Text = "Issue with username and/or password!";
                            this.Controls.Add(loginMessage);
                        }
                        
                    }
                }
                

                sc.Close();
            }
            catch
            {
                
            }
            //// Added functionality for Lab3 (Using the stored procedure)
            //SqlConnection sc = new SqlConnection(constr);

            //SqlCommand userLogin = new SqlCommand();
            //userLogin.Connection = sc;
            //userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            //userLogin.CommandText = "Customer_SP";
            //userLogin.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(emailTB.Text.ToString()));
            //userLogin.Parameters.AddWithValue("@PassWord", HttpUtility.HtmlEncode(passwordTB.Text.ToString()));

            //sc.Open();
            //SqlDataReader loginResults = userLogin.ExecuteReader();


            //if (loginResults.Read())
            //{
            //    Session["UserName"] = HttpUtility.HtmlEncode(emailTB.Text);
            //    Response.Redirect("CustomerHomePageBStrap.aspx");
            //    //Response.Redirect("CustomerHomePage.aspx");


            //}
            //else
            //{
            //    Label loginMessage = new Label();
            //    loginMessage.Text = "Issue with username and/or password!";
            //    this.Controls.Add(loginMessage);
            //    //lblStatus.Text = "Issue with username and/or password!";
            //}
            
        }

        protected void backtostartpage_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }

        protected void populate_Click(object sender, EventArgs e)
        {
            emailTB.Text = "Jenny@jmu.edu";
            passwordTB.Text = "testpass";
        }
    }
}