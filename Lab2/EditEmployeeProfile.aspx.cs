using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class EditEmployeeProfile : System.Web.UI.Page
    {
        string constr = "";
        private int empID = 7;
        protected void Page_Load()
        {
            if (Session["DBSource"].Equals("AWS"))
            {
                constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            }
            else
            {
                constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            }

            SqlConnection sqlConnect = new SqlConnection(constr);
            String email = "";
            String uname = "";
            if (Session["UserName"] != null)
            {
                email = HttpUtility.HtmlEncode(Session["UserName"].ToString());
                //uname = email.Substring(0, email.IndexOf("@"));
            }

            //nameTB.Text = uname;
            //emailTB.Text = email;
            String employeeQuery = "select EmployeeID, EmployeeName, Position, CellNumber from employee where EmailAddress = @email";
            SqlCommand cmd = new SqlCommand(employeeQuery, sqlConnect);
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            string pn = "";
            string position = "";
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    pn = HttpUtility.HtmlEncode((string)reader["CellNumber"]);
                    position = HttpUtility.HtmlEncode((string)reader["Position"]);
                    uname = HttpUtility.HtmlEncode((string)reader["EmployeeName"]);
                    this.empID = (int)reader["EmployeeID"];
                }
            }
            if (!IsPostBack)
            {
                pnTB.Text = pn;
                positionTB.Text = position;
                nameTB.Text = uname;
            }
            sqlConnect.Close();
        }

        protected void updateDB()
        {
            Page_Load();

            try
            {
                using (var connection = new SqlConnection(constr))
                {
                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandText = "UPDATE employee SET Position = @Position," +
                                                "CellNumber = @PhoneNumber," +
                                                "EmployeeName = @EmployeeName" +
                                                " where EmployeeID = @EmployeeID";

                        command.Parameters.AddWithValue("@Position", HttpUtility.HtmlEncode(positionTB.Text));
                        command.Parameters.AddWithValue("@PhoneNumber", HttpUtility.HtmlEncode(pnTB.Text));
                        //command.Parameters.AddWithValue("@EmailAddress", emailTB.Text);
                        command.Parameters.AddWithValue("@EmployeeName", HttpUtility.HtmlEncode(nameTB.Text));
                        command.Parameters.AddWithValue("@EmployeeID", empID);

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception e)
            {
                //MessageBox.Show($"Failed to update. Error message: {e.Message}");
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            updateDB();
            Response.Redirect("EmployeeProfile.aspx");
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeProfile.aspx");
        }
    }
}