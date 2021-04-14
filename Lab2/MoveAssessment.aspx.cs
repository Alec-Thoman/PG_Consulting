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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT CustomerId, CustomerName FROM Customer"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        customerddl.DataSource = cmd.ExecuteReader();
                        customerddl.DataTextField = "CustomerName";
                        customerddl.DataValueField = "CustomerId";
                        customerddl.DataBind();
                        con.Close();
                    }
                }
                customerddl.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }
        }

        protected void customerddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            int custID = int.Parse(customerddl.SelectedValue);

            String sqlQuery = "SELECT customer.CustomerName as Name, customer.customeraddress as Address, customer.EmailAddress, customer.PhoneNumber " +
                "from customer where customer.customerID = " + custID;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable Gridview = new DataTable();

            sqlAdapter.Fill(Gridview);

            grdCustomer.DataSource = Gridview;
            grdCustomer.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int custID = int.Parse(customerddl.SelectedValue);
            string msSql = "insert into MoveAssessment ([CustomerID]) values(@custID)";
            string preliminarySql = "insert into Preliminary([MoveOutDate], [MovingWindow], [MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID]) values (@MoveOutDate, @MovingWindow, @MLSListing, @SendPhotos, @AddOn, @AuctionService, @Street, @City, @State, @ZipCode, @MoveID)";
            string roomSql = "insert into Room([RoomType], [Furniture], [FloorLevel], [MoveID]) values(@RoomType, @Furniture, @FloorLevel, @MoveID)";
            string specificSql = "insert into SpecificInfo([HomeType], [TruckAccess], [LoadDoorDistance], [Steps], [SpecialEquip], [TruckType], [MoveID]) values(@HomeType, @TruckAccess, @LoadDoorDistance, @Steps, @SpecialEquip, @TruckType, @MoveID)";
            string costSql = "insert into Cost([MoveEst], [FixedRate], [ParkFee], [MoveID]) values(@MoveEst, @Fixed, @ParkFee, @MoveID)";

           
                using (var connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString))
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
                        cmd.Parameters.Add("@MoveOutDate", SqlDbType.NVarChar).Value = TextBox9.Text;
                        cmd.Parameters.Add("@MovingWindow", SqlDbType.NVarChar).Value = TextBox10.Text;
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
                        cmd.Parameters.Add("@Street", SqlDbType.NVarChar).Value = TextBox11.Text;
                        cmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = TextBox12.Text;
                        cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = TextBox13.Text;
                        cmd.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = TextBox14.Text;
                        cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;

                    

                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }

                    // insert into room table
                    if (TextBox15.Text != "")
                    {
                        using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                        {
                            connection.Open();


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label25.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox15.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label33.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox21.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label41.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox27.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label49.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox33.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label57.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox39.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label65.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox45.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label73.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox51.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label81.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox57.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label89.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox63.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label97.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox69.Text;
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


                            cmd.Parameters.Add("@RoomType", SqlDbType.NVarChar).Value = Label105.Text;
                            cmd.Parameters.Add("@Furniture", SqlDbType.NVarChar).Value = TextBox75.Text;
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
                            cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label115.Text;
                        }
                        if (CheckBox5.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label119.Text;
                        }
                        if (CheckBox7.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label120.Text;
                        }
                        if (CheckBox8.Checked == true)
                        {
                            cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label121.Text;
                        }

                        cmd.Parameters.Add("@TruckAccess", SqlDbType.NVarChar).Value = TextBox84.Text;
                        cmd.Parameters.Add("@LoadDoorDistance", SqlDbType.NVarChar).Value = TextBox85.Text;
                        cmd.Parameters.Add("@Steps", SqlDbType.NVarChar).Value = TextBox86.Text;

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
                        cmd.Parameters.Add("@MoveEst", SqlDbType.NVarChar).Value = TextBox87.Text;
                        cmd.Parameters.Add("@Fixed", SqlDbType.NVarChar).Value = TextBox88.Text;
                        cmd.Parameters.Add("@ParkFee", SqlDbType.NVarChar).Value = TextBox89.Text;
                        cmd.Parameters.Add("@MoveID", SqlDbType.Int).Value = moveID;

                        cmd.ExecuteNonQuery();
                        connection.Close();

                        
                    }



                

            }
           
        }
    
    }
}
