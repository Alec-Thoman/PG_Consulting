﻿using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
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
                loginMessage.Text = Session["InvalidUse"].ToString();
                this.Controls.Add(loginMessage);
                //lblStatus.Text = Session["InvalidUse"].ToString();
                //lblStatus.Font.Bold = true;
                //lblStatus.ForeColor = Color.Red;
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            // Added functionality for Lab3 (Using the stored procedure)
            SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

            SqlCommand userLogin = new SqlCommand();
            userLogin.Connection = sc;
            userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            userLogin.CommandText = "Customer_SP";
            userLogin.Parameters.AddWithValue("@UserName", emailTB.Text.ToString());
            userLogin.Parameters.AddWithValue("@PassWord", passwordTB.Text.ToString());

            sc.Open();
            SqlDataReader loginResults = userLogin.ExecuteReader();


            if (loginResults.Read())
            {
                Session["UserName"] = HttpUtility.HtmlEncode(emailTB.Text);
                Response.Redirect("CustomerHomePage.aspx");


            }
            else
            {
                Label loginMessage = new Label();
                loginMessage.Text = "Issue with username and/or password!";
                this.Controls.Add(loginMessage);
                //lblStatus.Text = "Issue with username and/or password!";
            }
            sc.Close();
        }

        protected void backtostartpage_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
    }
}