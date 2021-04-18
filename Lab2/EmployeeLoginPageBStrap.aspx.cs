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
        string constr = WebConfigurationManager.ConnectionStrings["AWSAuth"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // test if aws connection is open & available
            using (SqlConnection testConn = new SqlConnection(constr))
            {
                if (!testConn.IsAvailable())
                {
                    constr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;
                    //isAWS = false;
                }
            }
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
            
            // Added functionality for Lab3 (Using the stored procedure)
            SqlConnection sc = new SqlConnection(constr);

            SqlCommand userLogin = new SqlCommand();
           
            userLogin.Connection = sc;
            userLogin.CommandType = System.Data.CommandType.StoredProcedure;
            userLogin.CommandText = "Employee_SP";
            userLogin.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(txtEmail.Value.ToString()));
            userLogin.Parameters.AddWithValue("@PassWord", HttpUtility.HtmlEncode(txtPassword.Value.ToString()));

            sc.Open(); 
            SqlDataReader loginResults = userLogin.ExecuteReader();


            if (loginResults.Read())
            {
                Session["UserName"] = HttpUtility.HtmlEncode(txtEmail.Value);
                Response.Redirect("NewestEmployeeHomePage.aspx");

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
            txtEmail.Value = "1234@gmail.com";
            txtPassword.Value = "pas6684word";
        }
    }
}