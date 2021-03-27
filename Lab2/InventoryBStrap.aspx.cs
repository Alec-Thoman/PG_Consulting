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
    public partial class InventoryBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }
        protected void search_click(object sender, EventArgs e)
        {
            grdInventory.DataSource = null;
            grdInventory.DataBind();

            String customer = searchTxt.Value;

            String sqlQuery = "SELECT customer.CustomerName as [Customer Name], inventoryitem.StorageLocation as Lot, inventoryitem.Control as Control, inventoryitem.itemDescription as Description,  inventoryitem.InitialStorageDate as [Date Stored] from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid where " +
                "Customer.CustomerName = '" + customer + "'";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable InventoryGridview = new DataTable();

            sqlAdapter.Fill(InventoryGridview);

            grdInventory.DataSource = InventoryGridview;
            grdInventory.DataBind();
        }
        protected void updateGridView()
        {
            grdInventory.DataSource = null;
            grdInventory.DataBind();


            String sqlQuery = "SELECT customer.CustomerName as [Customer Name], inventoryitem.StorageLocation as Lot, inventoryitem.Control as Control, inventoryitem.itemDescription as Description,  inventoryitem.InitialStorageDate as [Date Stored] from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable InventoryGridview = new DataTable();

            sqlAdapter.Fill(InventoryGridview);

            grdInventory.DataSource = InventoryGridview;
            grdInventory.DataBind();
        }
    }
}