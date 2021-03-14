using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab2
{
    //Create By Yuhui AND Jocab 2/15/2021
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }

        protected void customerSelected(object sender, EventArgs e)
        {
            grdInventory.DataSource = null;
            grdInventory.DataBind();

            int custID = int.Parse(ddlCustomerList.SelectedValue);

            String sqlQuery = "SELECT customer.CustomerName, inventoryitem.itemDescription as Item, inventoryitem.Weight, inventoryitem.SalesPRICE, inventoryitem.StorageLocation, inventoryitem.StoragePurpose, inventoryitem.InitialStorageDate, inventoryitem.AuctionDate from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid where " +
                "customer.customerid =" + custID;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable InventoryGridview = new DataTable();

            sqlAdapter.Fill(InventoryGridview);

            grdInventory.DataSource = InventoryGridview;
            grdInventory.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            updateGridView();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            grdInventory.DataSource = null;
            grdInventory.DataBind();
        }

        protected void updateGridView()
        {
            grdInventory.DataSource = null;
            grdInventory.DataBind();


            String sqlQuery = "SELECT customer.CustomerName, inventoryitem.itemDescription as Item, inventoryitem.Weight, inventoryitem.SalesPRICE, inventoryitem.StorageLocation, inventoryitem.StoragePurpose, inventoryitem.InitialStorageDate, inventoryitem.AuctionDate from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable InventoryGridview = new DataTable();

            sqlAdapter.Fill(InventoryGridview);

            grdInventory.DataSource = InventoryGridview;
            grdInventory.DataBind();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHomePage.aspx");
        }
    }
}