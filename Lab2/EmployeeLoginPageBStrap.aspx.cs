using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Web.Configuration;
using System.Data.SqlClient;
namespace Lab2
{
    public partial class EmployeeLoginPageBStrap : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            constr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;

            if (Request.QueryString.Get("loggedout") == "true")
            {
                Label loginMessage = new Label();
                loginMessage.Text = "User has successfully log out";
                this.Controls.Add(loginMessage);
                //lblStatus.Text = "User has successfully log out";
                //lblStatus.Font.Bold = true;
                //lblStatus.ForeColor = Color.Green;
            }

            if (Session["InvalidUse"] != null)
            {
                Label loginMessage = new Label();
                loginMessage.Text = HttpUtility.HtmlEncode(Session["InvalidUse"].ToString());
                this.Controls.Add(loginMessage);
                //lblStatus.Text = Session["InvalidUse"].ToString();
                //lblStatus.Font.Bold = true;
                //lblStatus.ForeColor = Color.Red;
            }
            
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);


                sc.Open();
                SqlCommand findPass = new SqlCommand();
                findPass.Connection = sc;

                // SELECT PASSWORD Using Stored Procedure
                findPass.CommandType = System.Data.CommandType.StoredProcedure;
                findPass.CommandText = "JeremyEzellLab3";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtEmail.Value.ToString())));

                

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                   
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        
                        string storedHash = reader["Password"].ToString(); // store the database password into this variable
                        System.Diagnostics.Debug.WriteLine(storedHash);

                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(txtPassword.Value.ToString()), storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            Session["UserName"] = HttpUtility.HtmlEncode(txtEmail.Value.ToString());
                      
        
                            Response.Redirect("NewestEmployeeHomePage.aspx");
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
            // Added functionality for Lab3 (Using the stored procedure)
            //SqlConnection sc = new SqlConnection(constr);

            //SqlCommand userLogin = new SqlCommand();

            //userLogin.Connection = sc;
            //userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            //userLogin.CommandText = "Employee_SP";
            //userLogin.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(txtEmail.Value.ToString()));
            //userLogin.Parameters.AddWithValue("@PassWord", HttpUtility.HtmlEncode(txtPassword.Value.ToString()));

            //sc.Open(); 
            //SqlDataReader loginResults = userLogin.ExecuteReader();


            //if (loginResults.Read())
            //{
            //    Session["UserName"] = HttpUtility.HtmlEncode(txtEmail.Value);
            //    Response.Redirect("NewestEmployeeHomePage.aspx");

            //}
            //else
            //{
            //    Label loginMessage = new Label();
            //    loginMessage.Text = "Issue with username and/or password!";
            //    this.Controls.Add(loginMessage);
            //    //lblStatus.Text = "Issue with username and/or password!";
            //}
            //sc.Close();
        }

        protected void backtostartpage_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
        protected void populate_Click(object sender, EventArgs e)
        {
            txtEmail.Value = "admin";
            txtPassword.Value = "password";
        }
    }
}