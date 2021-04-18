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
        string constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // test if aws connection is open & available
            using (SqlConnection testConn = new SqlConnection(constr))
            {
                if (!testConn.IsAvailable())
                {
                    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                    //isAWS = false;
                }
            }

            if (Request.QueryString.Get("loggedout") == "true")
            {
                Label loginMessage = new Label();
                loginMessage.Text = "User has successfully logged out";
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

        protected void loginButton_Click(object sender, EventArgs e)
        {
            // Added functionality for Lab3 (Using the stored procedure)
            SqlConnection sc = new SqlConnection(constr);

            SqlCommand userLogin = new SqlCommand();
            userLogin.Connection = sc;
            userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            userLogin.CommandText = "Customer_SP";
            userLogin.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(emailTB.Text.ToString()));
            userLogin.Parameters.AddWithValue("@PassWord", HttpUtility.HtmlEncode(passwordTB.Text.ToString()));

            sc.Open();
            SqlDataReader loginResults = userLogin.ExecuteReader();


            if (loginResults.Read())
            {
                Session["UserName"] = HttpUtility.HtmlEncode(emailTB.Text);
                Response.Redirect("CustomerHomePageBStrap.aspx");
                //Response.Redirect("CustomerHomePage.aspx");


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

        protected void populate_Click(object sender, EventArgs e)
        {
            emailTB.Text = "Jenny@jmu.edu";
            passwordTB.Text = "testpass";
        }
    }
}