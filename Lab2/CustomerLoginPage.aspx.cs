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
    //Create By Yuhui AND Jocab 2/15/2020
    public partial class LoginPage : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString.Get("loggedout") == "true")
            {
                lblStatus.Text = "User has successfully log out";
                lblStatus.Font.Bold = true;
                lblStatus.ForeColor = Color.Green;
            }

            if(Session["InvalidUse"] != null)
            {
                lblStatus.Text = Session["InvalidUse"].ToString();
                lblStatus.Font.Bold = true;
                lblStatus.ForeColor = Color.Red;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            // Added functionality for Lab3 (Using the stored procedure)
            SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

            SqlCommand userLogin = new SqlCommand();
            userLogin.Connection = sc;
            userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            userLogin.CommandText = "Customer_SP";
            userLogin.Parameters.AddWithValue("@UserName", txtUserName.Text.ToString());
            userLogin.Parameters.AddWithValue("@PassWord", txtPassWord.Text.ToString());

            sc.Open();
            SqlDataReader loginResults = userLogin.ExecuteReader();


            if (loginResults.Read())
            {
                Session["UserName"] = HttpUtility.HtmlEncode(txtUserName.Text);
                Response.Redirect("CustomerHomePage.aspx");


            } else
            {
                lblStatus.Text = "Issue with username and/or password!";
            }
            sc.Close();


           
        }

        protected void correct_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "Jocab@jmu.edu";
            txtPassWord.Text = "password533";
        }

        protected void incorrect_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "Yuhui Li";
            txtPassWord.Text = "hellodog";
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
            lblStatus.Text = "";

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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartPage.aspx");
        }
    }
}