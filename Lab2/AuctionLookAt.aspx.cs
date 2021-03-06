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
    public partial class AuctionLookAt : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;
        string constr2 = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        bool isAWS = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (Session["IsForm"].ToString() == "true")
            {
                autofill();
            }
                
            if (!this.IsPostBack)
            {

                using (SqlConnection con = new SqlConnection(constr2))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT EmployeeID, EmployeeName FROM employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        employeeList.DataSource = cmd.ExecuteReader();
                        employeeList.DataTextField = "EmployeeName";
                        employeeList.DataValueField = "EmployeeID";
                        employeeList.DataBind();
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
            using (SqlConnection con = new SqlConnection(constr2))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT FirstName, LastName FROM InitialInfo where InitialInfoID = @InitID"))
                {
                    cmd.Parameters.Add("@InitID", SqlDbType.Int).Value = Convert.ToInt32(Session["InitialInfoID"].ToString());
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    //employeeList.DataSource = cmd.ExecuteReader();
                    //employeeList.DataTextField = "EmployeeName";
                    //employeeList.DataValueField = "EmployeeID";

                    //employeeList.DataBind();
                    con.Close();
                }
            }
            
            string newDirectory = "C:/Users/alect/Desktop/" + username; 

            // uses aws directory if using AWS
            if (isAWS)
            {
                newDirectory = username;
            }

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
            // IDs
            int boxID;
            int truckID;
            int crewID;

            string lookAtSql = "insert into AuctionLookAtEvent ([TruckAccess], [SuppliesNeeded], [Date], [InitialInfoID], [BoxID], [CrewID], [TruckID]) values(@TruckAccess,@SuppliesNeeded,@date,@custID,@bid,@cid,@tid)";
            string boxSql = "insert into Box ([Small], [Medium], [Large], [Art], [SmallPads], [LargePads]) values (@Small,@Medium,@Large,@Art,@SmallPad,@LargePad);SELECT CAST(scope_identity() AS int)";
            string truckSql = "insert into Truck ([Truck2015], [Truck2011], [Cube], [EnclosedTrailer], [OpenTrailer], [Van]) values (@truck2015,@truck2011,@cube,@et,@ot,@van);SELECT CAST(scope_identity() AS int)";
            try
            {
                using (var connection = new SqlConnection(constr2))
                {

                    // insert into box table
                    using (SqlCommand cmd = new SqlCommand(boxSql, connection))
                    {
                        connection.Open();

                        // checking to make sure tb's are not empty
                        string empty = "0";
                        if (smallTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@Small", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Small", SqlDbType.Int).Value = HttpUtility.HtmlEncode(smallTB.Text);
                        }

                        if (mediumTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@Medium", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Medium", SqlDbType.Int).Value = HttpUtility.HtmlEncode(mediumTB.Text);
                        }

                        if (largeTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@Large", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Large", SqlDbType.Int).Value = HttpUtility.HtmlEncode(largeTB.Text);
                        }

                        if (artTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@Art", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@Art", SqlDbType.Int).Value = HttpUtility.HtmlEncode(artTB.Text);
                        }

                        if (spTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@SmallPad", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@SmallPad", SqlDbType.Int).Value = HttpUtility.HtmlEncode(spTB.Text);
                        }

                        if (lpTB.Text.Equals(""))
                        {
                            cmd.Parameters.Add("@LargePad", SqlDbType.Int).Value = empty;
                        }
                        else
                        {
                            cmd.Parameters.Add("@LargePad", SqlDbType.Int).Value = HttpUtility.HtmlEncode(lpTB.Text);
                        }

                        boxID = (int)cmd.ExecuteScalar();
                        connection.Close();
                    }

                    string str = "";

                    for (int i = 0; i < employeeList.Items.Count; i++)
                    {
                        if (employeeList.Items[i].Selected == true)// getting selected value from CheckBox List  
                        {
                            str += employeeList.Items[i].Text + ','; // add selected Item text to the String
                        }


                    }
                    if (str != "")
                    {
                        str = str.Substring(0, str.Length - 7); // Remove Last "," from the string
                    }

                    string[] selectedItems = str.Split(','); //holds selected items

                    connection.Open();
                    DataTable dtInsertRows = new DataTable();
                    DataColumn col1 = new DataColumn("CrewMateName");
                    dtInsertRows.Columns.Add(col1);

                    for (int i = 0; i < selectedItems.Length; i++)
                    {
                        DataRow row1 = dtInsertRows.NewRow();
                        row1["CrewMateName"] = selectedItems[i];
                        dtInsertRows.Rows.Add(row1);
                    }
                    connection.Close();

                    using (SqlCommand comd = new SqlCommand("sp_BatchInsert", connection))
                    {
                        connection.Open();
                        comd.CommandType = CommandType.StoredProcedure;
                        comd.UpdatedRowSource = UpdateRowSource.None;

                        // Set the Parameter with appropriate Source Column Name
                        comd.Parameters.Add("@CrewMateName", SqlDbType.VarChar, 100, dtInsertRows.Columns[0].ColumnName);
                        Random random = new Random();
                        crewID = random.Next(1, 10);
                        comd.Parameters.Add("@CrewID", SqlDbType.Int).Value = crewID;

                        SqlDataAdapter adpt = new SqlDataAdapter();
                        adpt.InsertCommand = comd;
                        adpt.Update(dtInsertRows);
                        connection.Close();
                    }
                 
                    // Functionality for putting truck data into db
                    using (SqlCommand cmd2 = new SqlCommand(truckSql, connection))
                    {
                        connection.Open();

                        // checking to make sure tb's are not empty
                        string empty2 = "0";
                        if (tb2015.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@truck2015", SqlDbType.Int).Value = empty2;
                        }
                        else
                        {
                            cmd2.Parameters.Add("@truck2015", SqlDbType.Int).Value = HttpUtility.HtmlEncode(tb2015.Text);
                        }

                        if (tb2011.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@truck2011", SqlDbType.Int).Value = empty2;
                        }
                        else
                        {
                            cmd2.Parameters.Add("@truck2011", SqlDbType.Int).Value = HttpUtility.HtmlEncode(tb2011.Text);
                        }

                        if (cubetb.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@cube", SqlDbType.Int).Value = empty2;
                        }
                        else
                        {
                            cmd2.Parameters.Add("@cube", SqlDbType.Int).Value = HttpUtility.HtmlEncode(cubetb.Text);
                        }

                        if (ettb.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@et", SqlDbType.Int).Value = empty2;
                        } else
                        {
                            cmd2.Parameters.Add("@et", SqlDbType.Int).Value = HttpUtility.HtmlEncode(ettb.Text);
                        }

                        if (ottb.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@ot", SqlDbType.Int).Value = empty2;
                        } else
                        {
                            cmd2.Parameters.Add("@ot", SqlDbType.Int).Value = HttpUtility.HtmlEncode(ottb.Text);
                        }

                        if (vantb.Text.Equals(""))
                        {
                            cmd2.Parameters.Add("@van", SqlDbType.Int).Value = empty2;
                        } else
                        {
                            cmd2.Parameters.Add("@van", SqlDbType.Int).Value = HttpUtility.HtmlEncode(vantb.Text);
                        }
                        truckID = (int)cmd2.ExecuteScalar();
                        connection.Close();
                    }
                    
    
                    // insert into LookAt Table
                    using (SqlCommand command = new SqlCommand(lookAtSql, connection))
                    {
                        connection.Open();
                        command.Parameters.Add("@TruckAccess", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(truckAccesstb.Text).ToString();
                        command.Parameters.Add("@SuppliesNeeded", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(supNeedtb.Text).ToString();
                        command.Parameters.Add("@date", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(lookatDateTB.Text).ToString();
                        command.Parameters.Add("@custID", SqlDbType.Int).Value = Convert.ToInt32(Session["InitialInfoID"].ToString());
                        command.Parameters.Add("@bid", SqlDbType.Int).Value = boxID;
                        command.Parameters.Add("@cid", SqlDbType.Int).Value = crewID;
                        command.Parameters.Add("@tid", SqlDbType.Int).Value = truckID;

                        command.ExecuteScalar();
                        connection.Close();
                    }
                }
            }
            catch (Exception b)
            {
                //MessageBox.Show($"Failed to update. Error message: {e.Message}");
            }     
        }

        protected void popButton_Click(object sender, EventArgs e)
        {
            lookatDateTB.TextMode = TextBoxMode.SingleLine;
            lookatDateTB.Text = "03/09/2021";

            truckAccesstb.Text = "Narrow driveway";

            supNeedtb.Text = "Trailer, Magnifying Glass";

            smallBox.Checked = true;
            smallTB.Text = "3";

            artBox.Checked = true;
            artTB.Text = "1";


            check2011.Checked = true;
            tb2011.Text = "2";

            vancheck.Checked = true;
            vantb.Text = "1";

        }
        protected void autofill()
        {


            System.Diagnostics.Debug.WriteLine("testing11");
            using (var connection = new SqlConnection(constr2))
            {
                connection.Open();
                string auctionlookateventSQL = "Select TruckAccess, SuppliesNeeded, Date, InitialInfoID, BoxID, CrewID, TruckID" +
                    " From AuctionLookAtEvent where AuctionLookAtID = @FormID";
                SqlCommand cmd = new SqlCommand(auctionlookateventSQL, connection);
                cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Convert.ToInt32(Session["FormID"]);
                //System.Diagnostics.Debug.WriteLine("testingOG");
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (!IsPostBack)
                        {
                            truckAccesstb.Text = HttpUtility.HtmlEncode((string)reader["TruckAccess"]);
                            supNeedtb.Text = HttpUtility.HtmlEncode((string)reader["SuppliesNeeded"]);
                            lookatDateTB.Text = HttpUtility.HtmlEncode((string)reader["Date"]);
                        }
                    }
                }

                string auctionlookatBoxSQL = "Select Small, Medium, Large, Art, SmallPads, LargePads" +
                    " From Box where BoxID = @FormID";
                SqlCommand cmd2 = new SqlCommand(auctionlookatBoxSQL, connection);
                cmd2.Parameters.Add("@FormID", SqlDbType.Int).Value = Convert.ToInt32(Session["FormID"]);
                using (SqlDataReader reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (!IsPostBack)
                        {
                            smallTB.Text = HttpUtility.HtmlEncode((int)reader["Small"]);
                            mediumTB.Text = HttpUtility.HtmlEncode((int)reader["Medium"]);
                            largeTB.Text = HttpUtility.HtmlEncode((int)reader["Large"]);
                            artTB.Text = HttpUtility.HtmlEncode((int)reader["Art"]);
                            spTB.Text = HttpUtility.HtmlEncode((int)reader["SmallPads"]);
                            lpTB.Text = HttpUtility.HtmlEncode((int)reader["LargePads"]);
                        }
                    }
                }

                string auctionlookatTruckSQL = "Select Truck2015, Truck2011, Cube, EnclosedTrailer, OpenTrailer, Van" +
                " From Truck where TruckID = @FormID";
                SqlCommand cmd3 = new SqlCommand(auctionlookatTruckSQL, connection);
                cmd3.Parameters.Add("@FormID", SqlDbType.Int).Value = Convert.ToInt32(Session["FormID"]);
                using (SqlDataReader reader = cmd3.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (!IsPostBack)
                        {
                            tb2015.Text = HttpUtility.HtmlEncode((int)reader["Truck2015"]);
                            tb2011.Text = HttpUtility.HtmlEncode((int)reader["Truck2011"]);
                            cubetb.Text = HttpUtility.HtmlEncode((int)reader["Cube"]);
                            ettb.Text = HttpUtility.HtmlEncode((int)reader["EnclosedTrailer"]);
                            ottb.Text = HttpUtility.HtmlEncode((int)reader["OpenTrailer"]);
                            vantb.Text = HttpUtility.HtmlEncode((int)reader["Van"]);
                        }
                    }
                }
            }
        }
            }
        }