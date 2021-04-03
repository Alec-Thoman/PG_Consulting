using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT CustUserId, Username FROM CustomerUserInfo"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        customerddl.DataSource = cmd.ExecuteReader();
                        customerddl.DataTextField = "Username";
                        customerddl.DataValueField = "CustUserId";
                        customerddl.DataBind();
                        con.Close();
                    }
                }
                customerddl.Items.Insert(0, new ListItem("--Select Customer--", "0"));
                
                // For emp ddl
                string conn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT EmployeeID, EmployeeName FROM employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        employeeddl.DataSource = cmd.ExecuteReader();
                        employeeddl.DataTextField = "EmployeeName";
                        employeeddl.DataValueField = "EmployeeID";
                        employeeddl.DataBind();
                        con.Close();
                    }
                }
            }
        }

        private void CreateDirectoryIfNotExists(string NewDirectory)
        {
            try
            {
                // Checking the existence of directory
                if (!Directory.Exists(NewDirectory))
                {
                    //If no directory then creates the new one
                    Directory.CreateDirectory(NewDirectory);

                }
                else
                {
                    //Label1.Text = "Directory Exists";
                }
            }
            catch (IOException _err)
            {
                Response.Write(_err.Message);
            }
        }

        protected void fileUploadbtn_Click(object sender, EventArgs e)
        {
            string username = "";
            if (!(customerddl.SelectedIndex == 0))
            {
                username = customerddl.SelectedItem.Text;
            } 
            
            string newDirectory = "C:/Users/alect/Desktop/" + username; // change this to proper aws path when aws is setup
            //New Directory Name in string variable
            //CreateDirectoryIfNotExists(newDirectory);
            //Calling the function to create new directory

            if (username.Length > 0 && FileUpload1.HasFile)
            {
                CreateDirectoryIfNotExists(newDirectory);
                FileUpload1.SaveAs(newDirectory + "/" + FileUpload1.FileName);
                fileStatus.Text = "Image/File Uploaded Successfully!";

            }
            else
            {
                fileStatus.Text = "Select image/file/customer first !!";
            }
        }

        protected void HomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePageBStrap.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("EmployeeLoginPageBStrap.aspx?loggedout=true");
        }
    }
}