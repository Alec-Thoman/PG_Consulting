﻿using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            Label logintester = new Label();
            logintester.Text = "fuck";
            this.Controls.Add(logintester);
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
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Label logintest = new Label();
            logintest.Text = "Button Works";
            this.Controls.Add(logintest);
            // Added functionality for Lab3 (Using the stored procedure)
            SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

            SqlCommand userLogin = new SqlCommand();
            var email = Request["txtEmail"];
            userLogin.Connection = sc;
            userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            userLogin.CommandText = "JeremyEzellLab3";
            userLogin.Parameters.AddWithValue("@UserName", Request["txtEmail"]);
            userLogin.Parameters.AddWithValue("@PassWord", Request["txtPassword"]);

            System.Diagnostics.Debug.WriteLine("test");
            System.Diagnostics.Debug.WriteLine(Request["txtEmail"]);
            System.Diagnostics.Debug.WriteLine(Request["txtPassword"]);

            sc.Open(); 
            SqlDataReader loginResults = userLogin.ExecuteReader();


            if (loginResults.Read())
            {
                Session["UserName"] = HttpUtility.HtmlEncode(Request["txtEmail"]);
                //loginBtn.HRef = "EmployeeHomePage.aspx";
                //Response.Redirect("EmployeeHomePage.aspx");
                Label loginMessage = new Label();
                loginMessage.Text = "shouldve logged in fuck";
                this.Controls.Add(loginMessage);


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
        
    }
}