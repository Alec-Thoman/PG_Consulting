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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            updateGridview();

            dumbAddTB.Text = Session["address"].ToString();
            dumpCityTB.Text = Session["City"].ToString();
            dumpStateTB.Text = Session["State"].ToString();
            dumpZipTB.Text = Session["Zip"].ToString();
            chargeAmountTB.Text = Session["trashfee"].ToString();


            homeTypeTB.Text = Session["HomeType"].ToString();
            truckAccessTB.Text = Session["Ta"].ToString();
            walkTB.Text = Session["LD"].ToString();
            stepsTB.Text = Session["step"].ToString();
            specEquipTB.Text = Session["se"].ToString();
            trucksTB.Text = Session["Tt"].ToString();
            moveCostTB.Text = Session["movecost"].ToString();

            moveOutTB.Text = Session["MoveOut"].ToString();
            moveWindowTB.Text = Session["MovingWindow"].ToString();

            livingFurnTB.Text = Session["r1"].ToString();
            livingdroplist.SelectedValue = Session["ddl1"].ToString();
            smallLivingBoxTB.Text = Session["small1"].ToString();
            medLivingBoxTB.Text = Session["medium1"].ToString();
            largeLivingBoxTB.Text = Session["Large1"].ToString();
            wardrobeLivingBoxTB.Text = Session["Wardobe1"].ToString();
            artLivingBoxTB.Text = Session["Art1"].ToString();

            diningFurnTB.Text = Session["r2"].ToString();
            diningdroplist.SelectedValue = Session["ddl2"].ToString();
            smallDiningBoxTB.Text = Session["small2"].ToString();
            medDiningBoxTB.Text = Session["medium2"].ToString();
            largeDiningBoxTB.Text = Session["Large2"].ToString();
            wardrobeDiningBoxTB.Text = Session["Wardobe2"].ToString();
            artDiningBoxTB.Text = Session["Art2"].ToString();

            kitFurnlblTB.Text = Session["r3"].ToString();
            kitdroplist.SelectedValue = Session["ddl3"].ToString();
            smallKitBoxTB.Text = Session["small3"].ToString();
            mediumKitBoxTB.Text = Session["medium3"].ToString();
            largeKitBoxTB.Text = Session["Large3"].ToString();
            wardrobeKitBoxTB.Text = Session["Wardobe3"].ToString();
            artKitBoxTB.Text = Session["Art3"].ToString();

            denFurnTB.Text = Session["r4"].ToString();
            dendroplist.SelectedValue = Session["ddl4"].ToString();
            smallDenBoxTB.Text = Session["small4"].ToString();
            mediumDenBoxTB.Text = Session["medium4"].ToString();
            largeDenBoxTB.Text = Session["Large4"].ToString();
            wardrobeDenBoxTB.Text = Session["Wardobe4"].ToString();
            artDenBoxTB.Text = Session["Art4"].ToString();

            offFurnTB.Text = Session["r5"].ToString();
            offdroplist.SelectedValue = Session["ddl5"].ToString();
            smallOffBoxTB.Text = Session["small5"].ToString();
            mediumOffBoxTB.Text = Session["medium5"].ToString();
            largeOffBoxTB.Text = Session["Large5"].ToString();
            wardrobeOffBoxTB.Text = Session["Wardobe5"].ToString();
            artOffBoxTB.Text = Session["Art5"].ToString();

            bedFurnTB.Text = Session["r6"].ToString();
            beddroplist.SelectedValue = Session["ddl6"].ToString();
            smallBedBoxTB.Text = Session["small6"].ToString();
            mediumBedBoxTB.Text = Session["medium6"].ToString();
            largeBedBoxTB.Text = Session["Large6"].ToString();
            wardrobeBedBoxTB.Text = Session["Wardobe6"].ToString();
            artBedBoxTB.Text = Session["Art6"].ToString();

            attFurnTB.Text = Session["r7"].ToString();
            attdroplist.SelectedValue = Session["ddl7"].ToString();
            smallAttBoxTB.Text = Session["small7"].ToString();
            mediumAttBoxTB.Text = Session["medium7"].ToString();
            largeAttBoxTB.Text = Session["Large7"].ToString();
            wardrobeAttBoxTB.Text = Session["Wardobe7"].ToString();
            artAttBoxTB.Text = Session["Art7"].ToString();

            baseFurnTB.Text = Session["r8"].ToString();

            smallBaseBoxTB.Text = Session["small8"].ToString();
            mediumBaseBoxTB.Text = Session["medium8"].ToString();
            largeBaseBoxTB.Text = Session["Large8"].ToString();
            wardrobeBaseBoxTB.Text = Session["Wardobe8"].ToString();
            artBaseBoxTB.Text = Session["Art8"].ToString();

            garFurnTB.Text = Session["small9"].ToString();
            gardroplist.SelectedValue = Session["ddl9"].ToString();
            smallGarBoxTB.Text = Session["small9"].ToString();
            mediumGarBoxTB.Text = Session["medium9"].ToString();
            largeGarBoxTB.Text = Session["Large9"].ToString();
            wardrobeGarBoxTB.Text = Session["Wardobe9"].ToString();
            artGarBoxTB.Text = Session["Art9"].ToString();

            patFurnTB.Text = Session["small10"].ToString();
            patdroplist.SelectedValue = Session["ddl10"].ToString();
            smallPatBoxTB.Text = Session["small10"].ToString();
            mediumPatBoxTB.Text = Session["medium10"].ToString();
            largePatBoxTB.Text = Session["Large10"].ToString();
            wardrobePatBoxTB.Text = Session["Wardobe10"].ToString();
            artPatBoxTB.Text = Session["Art10"].ToString();

            outFurnTB.Text = Session["small11"].ToString();
            outdroplist.SelectedValue = Session["ddl11"].ToString();
            smallOutBoxTB.Text = Session["small11"].ToString();
            mediumOutBoxTB.Text = Session["medium11"].ToString();
            largeOutBoxTB.Text = Session["Large11"].ToString();
            wardrobeOutBoxTB.Text = Session["Wardobe11"].ToString();
            artOutBoxTB.Text = Session["Art11"].ToString();




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