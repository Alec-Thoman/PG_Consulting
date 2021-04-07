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

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string lookAtSql = "insert into AuctionLookAtEvent ([TruckAccess], [SuppliesNeeded]) values(@TruckAccess,@SuppliesNeeded)";
            string boxSql = "insert into Box ([Small], [Medium], [Large], [Art], [SmallPads], [LargePads]) values (@Small,@Medium,@Large,@Art,@SmallPad,@LargePad)";
            try
            {
                using (var connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString))
                {
                    connection.Open();
                    // insert into LookAt Table
                    using (SqlCommand command = new SqlCommand(lookAtSql, connection))
                    {
                        command.Parameters.Add("@TruckAccess", SqlDbType.NVarChar).Value = truckAccesstb.Text;
                        command.Parameters.Add("@SuppliesNeeded", SqlDbType.NVarChar).Value = supNeedtb.Text;

                        command.ExecuteNonQuery();
                        connection.Close();
                    }

                    // insert into box table
                    using (SqlCommand cmd = new SqlCommand(boxSql, connection))
                    {
                        connection.Open();

                        // checking to make sure tb's are not empty
                        string empty = "0";
                        if (smallTB.Equals(""))
                        {
                            cmd.Parameters.Add("@Small", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Small", SqlDbType.Int).Value = smallTB.Text;
                        }

                        if (mediumTB.Equals(""))
                        {
                            cmd.Parameters.Add("@Medium", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Medium", SqlDbType.Int).Value = mediumTB.Text;
                        }

                        if (largeTB.Equals(""))
                        {
                            cmd.Parameters.Add("@Large", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Large", SqlDbType.Int).Value = largeTB.Text;
                        }

                        if (artTB.Equals(""))
                        {
                            cmd.Parameters.Add("@Art", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Art", SqlDbType.Int).Value = artTB.Text;
                        }

                        if (spTB.Equals(""))
                        {
                            cmd.Parameters.Add("@SmallPad", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@SmallPad", SqlDbType.Int).Value = spTB.Text;
                        }

                        if (lpTB.Equals(""))
                        {
                            cmd.Parameters.Add("@LargePad", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@LargePad", SqlDbType.Int).Value = lpTB.Text;
                        }

                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception b)
            {
                //MessageBox.Show($"Failed to update. Error message: {e.Message}");
            }     
        }
    }
}