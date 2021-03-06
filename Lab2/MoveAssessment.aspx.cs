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
    public partial class MoveAssessment : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsForm"].ToString() == "true" )
            {
                autofill();
            }
        }

        protected void customerddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            int custID = int.Parse(Session["InitialInfoID"].ToString());

            String sqlQuery = "SELECT FirstName + ' ' + LastName as CustomerName, PhoneNumber, Email, State " +
                "from InitialInfo where InitialInfoID = " + custID;

            SqlConnection sqlConnect = new SqlConnection(constr);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable Gridview = new DataTable();

            sqlAdapter.Fill(Gridview);

            grdCustomer.DataSource = Gridview;
            grdCustomer.DataBind();
        }
        

            protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int custID = int.Parse(Session["InitialInfoID"].ToString());
            string msSql = "insert into MoveAssessment ([InitialInfoID]) values(@custID)";
            string preliminarySql = "insert into Preliminary([MoveOutDate], [MovingWindow], [MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID] ,[DateCreated]) values (@MoveOutDate, @MovingWindow, @MLSListing, @SendPhotos, @AddOn, @AuctionService, @Street, @City, @State, @ZipCode, @MoveID, @DateCreated)";
            string roomSql = "insert into Room([RoomType], [Furniture], [FloorLevel], [MoveID]) values(@RoomType, @Furniture, @FloorLevel, @MoveID)";
            string specificSql = "insert into SpecificInfo([HomeType], [TruckAccess], [LoadDoorDistance], [Steps], [SpecialEquip], [TruckType], [MoveID]) values(@HomeType, @TruckAccess, @LoadDoorDistance, @Steps, @SpecialEquip, @TruckType, @MoveID)";
            string costSql = "insert into Cost([MoveEst], [FixedRate], [ParkFee], [MoveID]) values(@MoveEst, @Fixed, @ParkFee, @MoveID)";

           
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    // insert into moveassessment table Table
                    using (SqlCommand command = new SqlCommand(msSql, connection))
                    {
                        command.Parameters.Add("@custID", SqlDbType.Int).Value = custID;
                        command.ExecuteNonQuery();
                        connection.Close();
                    }

                    // get the move id
                    int moveID = 0;
                    String result = "";

                    connection.Open();
                    String sqlIDQuery = "Select MAX(MoveID) from MoveAssessment";
                    SqlCommand sqlCommand1 = new SqlCommand();
                    sqlCommand1.Connection = connection;
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlCommand1.CommandText = sqlIDQuery;

                    SqlDataReader queryIDResults = sqlCommand1.ExecuteReader();

                    while (queryIDResults.Read())
                    {
                        result = queryIDResults[0].ToString();
                    }
                    queryIDResults.Close();
                    connection.Close();

                    moveID = Int32.Parse(result);


                    // insert into preliminary table
                    using (SqlCommand cmd = new SqlCommand(preliminarySql, connection))
                    {
                        connection.Open();
                        string yes = "Yes";
                        string no = "No";
                        cmd.Parameters.Add("@MoveOutDate", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox9.Text);
                        cmd.Parameters.Add("@MovingWindow", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox10.Text);
                        if (CheckBox1.Checked == true)
                        {
                            cmd.Parameters.Add("@MLSListing", SqlDbType.NVarChar).Value = yes;
                        }
                        else
                        {
                            cmd.Parameters.Add("@MLSListing", SqlDbType.NVarChar).Value = no;
                        }
                        if (CheckBox2.Checked == true)
                        {
                            cmd.Parameters.Add("@AddOn", SqlDbType.NVarChar).Value = yes;
                        }
                        else
                        {
                            cmd.Parameters.Add("@AddOn", SqlDbType.NVarChar).Value = no;
                        }
                        if (CheckBox4.Checked == true)
                        {
                            cmd.Parameters.Add("@AuctionService", SqlDbType.NVarChar).Value = yes;
                        }
                        else
                        {
                            cmd.Parameters.Add("@AuctionService", SqlDbType.NVarChar).Value = no;
                        }

                        cmd.Parameters.Add("@SendPhotos", SqlDbType.NVarChar).Value = DropDownList1.SelectedValue;
                        cmd.Parameters.Add("@Street", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox11.Text);
                        cmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox12.Text);
                        cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox13.Text);
                        cmd.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox14.Text);
                        cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;
                        cmd.Parameters.Add("@DateCreated", SqlDbType.NVarChar).Value = DateTime.Now.ToString("g");

                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }

                    // insert into room table
                    if (TextBox15.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label25.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox15.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList2.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox21.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label33.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox21.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList3.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox27.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label41.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox27.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList4.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox33.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label49.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox33.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList5.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox39.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label57.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox39.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList6.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox45.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label65.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox45.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList7.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox51.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label73.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox51.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList8.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox57.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label81.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox57.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList9.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox63.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label89.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox63.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList10.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox69.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label97.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox69.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList11.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (TextBox75.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(Label105.Text);
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox75.Text);
                            cmd.Parameters.Add("@FloorLevel", SqlDbType.NVarChar).Value = DropDownList12.SelectedValue;
                            cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;


                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }


                    }

                    // insert into SpecificInfo table
                    using (SqlCommand cmd = new SqlCommand(specificSql, connection))
                    {
                        connection.Open();
                        string specialEquip = "";
                        string truckType = "";
                        if (CheckBox6.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(Label115.Text);
                        }
                        if (CheckBox5.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(Label119.Text);
                        }
                        if (CheckBox7.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(Label120.Text);
                        }
                        if (CheckBox8.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(Label121.Text);
                        }

                        cmd.Parameters.Add("@TruckAccess", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox84.Text);
                        cmd.Parameters.Add("@LoadDoorDistance", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox85.Text);
                        cmd.Parameters.Add("@Steps", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox86.Text);

                        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                        {
                            if (CheckBoxList1.Items[i].Selected)
                            { specialEquip += CheckBoxList1.Items[i].Text + ", "; }
                        }

                        cmd.Parameters.Add("@SpecialEquip", SqlDbType.NVarChar).Value = specialEquip;


                        for (int i = 0; i < CheckBoxList2.Items.Count; i++)
                        {
                            if (CheckBoxList2.Items[i].Selected)
                            { truckType += CheckBoxList2.Items[i].Text + ", "; }
                        }

                        cmd.Parameters.Add("@TruckType", SqlDbType.NVarChar).Value = truckType;
                        cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;

                        cmd.ExecuteNonQuery();
                        connection.Close();

                        
                    }


                    // insert into Cost table
                    using (SqlCommand cmd = new SqlCommand(costSql, connection))
                    {
                        connection.Open();
                        cmd.Parameters.Add("@MoveEst", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox87.Text);
                        cmd.Parameters.Add("@Fixed", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox88.Text);
                        cmd.Parameters.Add("@ParkFee", SqlDbType.NVarChar).Value = HttpUtility.HtmlEncode(TextBox89.Text);
                        cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;

                        cmd.ExecuteNonQuery();
                        connection.Close();

                        
                    }



                

            }
           
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            TextBox9.Text = "05/09/2021";
            TextBox10.Text = "7";
            TextBox11.Text = "1234 Nova Drive";
            TextBox12.Text = "Alexandria";
            TextBox13.Text = "VA";
            TextBox14.Text = "22804";
            TextBox15.Text = "Chair";
            TextBox33.Text = "Couch";
            TextBox57.Text = "King Bed";
            TextBox84.Text = "Narrow driveway";
            CheckBox5.Checked = true;
            TextBox86.Text = "7";
            CheckBoxList1.Items[1].Selected = true;
            CheckBoxList1.Items[3].Selected = true;

            CheckBoxList2.Items[0].Selected = true;
            CheckBoxList2.Items[4].Selected = true;
            TextBox87.Text = "$500";
            TextBox88.Text = "$25";
            TextBox89.Text = "$15";
            TextBox90.Text = "$90";
            TextBox91.Text = "$5";
            TextBox16.Text = "2";
            TextBox16.Text = "1";
            TextBox20.Text = "3";
            //TextBox27.Text = "2";
            TextBox35.Text = "4";
            TextBox36.Text = "2";
            TextBox58.Text = "1";
            TextBox61.Text = "4";

        }

        protected void autofill()
        {
            SqlConnection sqlConnect = new SqlConnection(constr);
            sqlConnect.Open();
            String Holder = "";
            String sqlQuery = "SELECT MoveOutDate FROM Preliminary WHERE MoveID = @FormID";
            SqlCommand cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox9.Text = Holder;
            }
            sqlQuery = "SELECT MovingWindow FROM Preliminary WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox10.Text = Holder;
            }
            sqlQuery = "SELECT MLSListing FROM Preliminary WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "NA")
                {
                    CheckBox1.Checked = false;
                }
                else
                {
                    CheckBox1.Checked = true;
                }
            }
            sqlQuery = "SELECT SendPhotos FROM Preliminary WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "Yes")
                {
                    DropDownList1.Items[0].Selected = true;
                }
                else
                {
                    DropDownList1.Items[1].Selected = true;
                }
            }
            sqlQuery = "SELECT AddOn FROM Preliminary WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "Add ons")
                {
                    CheckBox2.Checked = true;
                }
                else
                {
                    CheckBox3.Checked = true;
                }
            }
            sqlQuery = "SELECT AuctionService FROM Preliminary WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "Auction Service")
                {
                    CheckBox4.Checked = true;
                }
                else
                {
                    CheckBox4.Checked = false;
                }
            }
             sqlQuery = "SELECT Street FROM Preliminary WHERE MoveID = @FormID";
             cmd = new SqlCommand(sqlQuery, sqlConnect);
             cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox11.Text = Holder;
            }
             sqlQuery = "SELECT City FROM Preliminary WHERE MoveID = @FormID";
             cmd = new SqlCommand(sqlQuery, sqlConnect);
             cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox12.Text = Holder;
            }
             sqlQuery = "SELECT State FROM Preliminary WHERE MoveID = @FormID";
             cmd = new SqlCommand(sqlQuery, sqlConnect);
             cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox13.Text = Holder;
            }
             sqlQuery = "SELECT ZipCode FROM Preliminary WHERE MoveID = @FormID";
             cmd = new SqlCommand(sqlQuery, sqlConnect);
             cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox14.Text = Holder;
            }
            sqlQuery = "SELECT HomeType FROM SpecificInfo WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "House")
                {
                    CheckBox5.Checked = true;
                }
                if (Holder == "Apartment")
                {
                    CheckBox6.Checked = true;
                }
                if (Holder == "Storage Unity")
                {
                    CheckBox7.Checked = true;
                }
                if (Holder == "Place of Business")
                {
                    CheckBox8.Checked = true;
                    TextBox83.Text = Holder;
                }
            }
            sqlQuery = "SELECT TruckAccess FROM SpecificInfo WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox84.Text = Holder;
            }
            sqlQuery = "SELECT LoadDoorDistance FROM SpecificInfo WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox85.Text = Holder;
            }
            sqlQuery = "SELECT Steps FROM SpecificInfo WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox86.Text = Holder;
            }
            sqlQuery = "SELECT SpecialEquip FROM SpecificInfo WHERE MoveID = @FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "Special Equipment")
                {
                    CheckBoxList1.Items[0].Selected = true;
                }
            }
            
            sqlQuery = "SELECT Furniture FROM Room WHERE MoveID = @FormID and RoomType = 'Living Room:' ";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
            }
            

            sqlQuery = "SELECT TruckType FROM SpecificInfo WHERE MoveID=@FormID";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                if (Holder == "Truck Type")
                {
                    CheckBoxList2.Items[0].Selected = true;
                }
            }

            if (cmd.ExecuteScalar() != null)
            {
                //Holder = cmd.ExecuteScalar().ToString();
                //TextBox87.Text = Holder;
            }
            //sqlQuery = "SELECT FixedRate FROM Cost WHERE MoveID=" + Session["FormID"];
            //cmd = new SqlCommand(sqlQuery, sqlConnect);
            if (cmd.ExecuteScalar() != null)
            {
                //Holder = cmd.ExecuteScalar().ToString();
                //TextBox88.Text = Holder;
            }
            //sqlQuery = "SELECT ParkFee FROM Cost WHERE MoveID=" + Session["FormID"];
            //cmd = new SqlCommand(sqlQuery, sqlConnect);
            if (cmd.ExecuteScalar() != null)
            {
                //Holder = cmd.ExecuteScalar().ToString();
                //TextBox89.Text = Holder;
            }
            ////sqlQuery = "SELECT StorageFee FROM Cost WHERE MoveID=" + Session["FormID"];
            ////cmd = new SqlCommand(sqlQuery, sqlConnect);
            /// if (cmd.ExecuteScalar() != null)
            {
                ////Holder = cmd.ExecuteScalar().ToString();
                ////TextBox10.Text = Holder;
            }
            //sqlQuery = "SELECT MoveEst FROM Cost WHERE MoveID=" + Session["FormID"];
            //cmd = new SqlCommand(sqlQuery, sqlConnect);
            if (cmd.ExecuteScalar() != null)
            {
                //Holder = cmd.ExecuteScalar().ToString();
                //TextBox91.Text = Holder;
            }

            sqlQuery = "SELECT Furniture FROM Room WHERE MoveID = @FormID and RoomType = 'Living Room:' ";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox21.Text = Holder;
            }
            sqlQuery = "SELECT FloorLevel FROM Room WHERE MoveID = @FormID and RoomType = 'Living Room:' ";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                DropDownList3.SelectedValue = Holder;
            }
            sqlQuery = "SELECT Furniture FROM Room WHERE MoveID = @FormID and RoomType = 'Kitchen:' ";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                TextBox27.Text = Holder;
            }
            sqlQuery = "SELECT FloorLevel FROM Room WHERE MoveID = @FormID and RoomType = 'Kitchen:' ";
            cmd = new SqlCommand(sqlQuery, sqlConnect);
            cmd.Parameters.Add("@FormID", SqlDbType.Int).Value = Session["FormID"];
            if (cmd.ExecuteScalar() != null)
            {
                Holder = cmd.ExecuteScalar().ToString();
                DropDownList4.SelectedValue = Holder;
            }

            }
    }
}
