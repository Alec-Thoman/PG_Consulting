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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["DBSource"].Equals("AWS"))
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //}
            //else
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}
            constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;

            if (!this.IsPostBack)
            {
                //using (SqlConnection con = new SqlConnection(constr))
                //{
                //    using (SqlCommand cmd = new SqlCommand("SELECT InitialInfoID, Email FROM InitialInfo"))
                //    {
                //        cmd.CommandType = CommandType.Text;
                //        cmd.Connection = con;
                //        con.Open();
                //        customerddl.DataSource = cmd.ExecuteReader();
                //        customerddl.DataTextField = "Email";
                //        customerddl.DataValueField = "InitialInfoID";
                //        customerddl.DataBind();
                //        con.Close();
                //    }
                //}
                //customerddl.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }
        }

        protected void customerddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();

            int custID = int.Parse(Session["InitialInfoID"].ToString());
            Session["custid"] = custID;

            String sqlQuery = "SELECT FirstName + ' ' + LastName as CustomerName, PhoneNumber, Email, State " +
                "from InitialInfo where InitialInfoID = " + custID;

            SqlConnection sqlConnect = new SqlConnection(constr);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable Gridview = new DataTable();

            sqlAdapter.Fill(Gridview);

            grdCustomer.DataSource = Gridview;
            grdCustomer.DataBind();
        }

        protected void btnSumbit_Click(object sender, EventArgs e)
        {
            int custID = int.Parse(Session["InitialInfoID"].ToString());
            string asSql = "insert into AuctionAssessment ([InitialInfoID]) values(@custID)";
            string assessmentSql = "insert into Assessment([DateCreated], [ItemsSelling], [WhyService], [Deadline], [Scheduled], [AskedPhotos], [AskedItemList], [AdtlService], [AuctionID]) values (@DateCreated, @ItemSelling, @WhyService, @Deadline, @Scheduled, @AskPhotos, @AskItemList, @AdtlService, @AuctionID)";
            string otherInfoSql = "insert into OtherInfo([HomeType], [TruckAccess], [LoadDoorDistance], [Steps], [SpecialEquip], [TruckType], [AuctionID]) values(@HomeType, @TruckAccess, @LoadDoorDistance, @Steps, @SpecialEquip, @TruckType, @AuctionID)";
            string feesSql = "insert into Fees([PickUp], [ConsignmentRate], [TrashFee], [AdditionalFee], [AuctionID]) values(@PickUp, @ConsignmentRate, @TrashFee, @AdditionalFee, @AuctionID)";



            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                // insert into moveassessment table Table
                using (SqlCommand command = new SqlCommand(asSql, connection))
                {
                    command.Parameters.Add("@custID", SqlDbType.Int).Value = custID;
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // get the move id
                int auctionID = 0;
                String result = "";

                connection.Open();
                String sqlIDQuery = "Select MAX(AuctionID) from AuctionAssessment";
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

                auctionID = Int32.Parse(result);

                // insert into preliminary table
                using (SqlCommand cmd = new SqlCommand(assessmentSql, connection))
                {
                    connection.Open();
                    string yes = "Yes";
                    string no = "No";
                    cmd.Parameters.Add("@ItemSelling", SqlDbType.NVarChar).Value = TextBox9.Text;
                    cmd.Parameters.Add("@Deadline", SqlDbType.NVarChar).Value = TextBox10.Text;
                    if (CheckBox9.Checked == true)
                    {
                        cmd.Parameters.Add("@AskPhotos", SqlDbType.NVarChar).Value = yes;
                    }
                    else
                    {
                        cmd.Parameters.Add("@AskPhotos", SqlDbType.NVarChar).Value = no;
                    }

                    if (CheckBox10.Checked == true)
                    {
                        cmd.Parameters.Add("@AskItemList", SqlDbType.NVarChar).Value = yes;
                    }
                    else
                    {
                        cmd.Parameters.Add("@AskItemList", SqlDbType.NVarChar).Value = no;
                    }


                    cmd.Parameters.Add("@WhyService", SqlDbType.NVarChar).Value = DropDownList1.SelectedValue;
                    cmd.Parameters.Add("@Scheduled", SqlDbType.NVarChar).Value = TextBox11.Text;
                    cmd.Parameters.Add("@AdtlService", SqlDbType.NVarChar).Value = DropDownList2.SelectedValue;
                    cmd.Parameters.Add("@AuctionID", SqlDbType.NVarChar).Value = auctionID;
                    cmd.Parameters.Add("@DateCreated", SqlDbType.NVarChar).Value = DateTime.Now.ToString("g"); 

                    






                    cmd.ExecuteNonQuery();
                    connection.Close();
                }

                using (SqlCommand cmd = new SqlCommand(otherInfoSql, connection))
                {
                    connection.Open();
                    string specialEquip = "";
                    string truckType = "";
                    if (CheckBox6.Checked == true)
                    {
                        cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label115.Text;
                        Session["HomeType"] = Label115.Text; ;
                    }
                    if (CheckBox5.Checked == true)
                    {
                        cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label119.Text;
                        Session["HomeType"] = Label119.Text; 
                    }
                    if (CheckBox7.Checked == true)
                    {
                        cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label120.Text;
                        Session["HomeType"] = Label120.Text;
                    }
                    if (CheckBox8.Checked == true)
                    {
                        cmd.Parameters.Add("@HomeType", SqlDbType.NVarChar).Value = Label121.Text;
                        Session["HomeType"] = Label121.Text;
                    }

                    cmd.Parameters.Add("@TruckAccess", SqlDbType.NVarChar).Value = TextBox84.Text;
                    Session["truckAccess"] = TextBox84.Text;
                    cmd.Parameters.Add("@LoadDoorDistance", SqlDbType.NVarChar).Value = TextBox85.Text;
                    Session["dis"] = TextBox85.Text;
                    cmd.Parameters.Add("@Steps", SqlDbType.NVarChar).Value = TextBox86.Text;
                    Session["step"] = TextBox86.Text;

                    for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                    {
                        if (CheckBoxList1.Items[i].Selected)
                        { specialEquip += CheckBoxList1.Items[i].Text + ", "; }
                    }

                    cmd.Parameters.Add("@SpecialEquip", SqlDbType.NVarChar).Value = specialEquip;
                    Session["specialEquip"] = specialEquip;


                    for (int i = 0; i < CheckBoxList2.Items.Count; i++)
                    {
                        if (CheckBoxList2.Items[i].Selected)
                        { truckType += CheckBoxList2.Items[i].Text + ", "; }
                    }

                    cmd.Parameters.Add("@TruckType", SqlDbType.NVarChar).Value = truckType;
                    Session["TruckType"] = truckType;
                    cmd.Parameters.Add("@AuctionID", SqlDbType.Int).Value = auctionID;

                    cmd.ExecuteNonQuery();
                    connection.Close();

                }


                    // insert into Cost table
                    using (SqlCommand cmd = new SqlCommand(feesSql, connection))
                    {
                        connection.Open();
                        cmd.Parameters.Add("@PickUp", SqlDbType.NVarChar).Value = TextBox87.Text;
                        cmd.Parameters.Add("@ConsignmentRate", SqlDbType.NVarChar).Value = TextBox88.Text;
                        cmd.Parameters.Add("@TrashFee", SqlDbType.NVarChar).Value = TextBox91.Text;
                        cmd.Parameters.Add("@AdditionalFee", SqlDbType.NVarChar).Value = TextBox12.Text;
                        cmd.Parameters.Add("@AuctionID", SqlDbType.Int).Value = auctionID;

                        cmd.ExecuteNonQuery();
                        connection.Close();

                    
                    }

                Session["Scheduled"] = Label17.Text;
                int CustID = int.Parse(Session["InitialInfoID"].ToString());
                Session["custid"] = CustID;
                Session["TrashFee"] = TextBox91.Text;
                Session["decription"] = TextBox11.Text;
                



                Response.Redirect("AuctionOrder.aspx");

            }
            }

            protected void btnPopulateAuctionA_Click(object sender, EventArgs e)
            {

            }


        }
        
        

        
}
