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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            updateGridview();


            chargeAmountTB.Text = Session["TrashFee"].ToString();
            scheduledTB.Text = Session["Scheduled"].ToString();
            trashDescTB.Text = Session["decription"].ToString();
            homeTypeTB.Text = Session["HomeType"].ToString();
            truckAccessTB.Text = Session["truckAccess"].ToString();
            walkTB.Text = Session["dis"].ToString();
            stepsTB.Text = Session["step"].ToString();
            specEquipTB.Text = Session["specialEquip"].ToString();
            trucksTB.Text = Session["TruckType"].ToString();


        }

        protected void updateGridview()
        {
            grdCustomer.DataSource = null;
            grdCustomer.DataBind();


            String sqlQuery = "SELECT FirstName + ' ' + LastName as CustomerName, PhoneNumber, Email, State, City, Street, ZipCode " +
                "from InitialInfo where InitialInfoID = " + Session["custid"];

            SqlConnection sqlConnect = new SqlConnection(constr);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable Gridview = new DataTable();

            sqlAdapter.Fill(Gridview);

            grdCustomer.DataSource = Gridview;
            grdCustomer.DataBind();
        }
    }
}