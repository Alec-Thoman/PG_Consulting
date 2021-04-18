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

            updateGridView();
        }
        protected void search_click(object sender, EventArgs e)
        {
            grdInventory.DataSource = null;
            grdInventory.DataBind();
            String sqlQuery = "";
            if (String.IsNullOrEmpty(searchTxt.Value))
            {
                sqlQuery = "SELECT customer.CustomerName as [Customer Name], inventoryitem.StorageLocation as Lot, inventoryitem.Control as Control, inventoryitem.itemDescription as Description,  inventoryitem.InitialStorageDate as [Date Stored] from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid";
                
            }
            else
            {
                String customer = searchTxt.Value;

                sqlQuery = "SELECT customer.CustomerName as [Customer Name], inventoryitem.StorageLocation as Lot, inventoryitem.Control as Control, inventoryitem.itemDescription as Description,  inventoryitem.InitialStorageDate as [Date Stored] from InventoryService inner join InventoryItem on InventoryItem.itemid " +
                    "= InventoryService.itemid inner join ServiceTicket on ServiceTicket.serviceticketid = inventoryservice.serviceticketid inner join customer on customer.customerid = serviceticket.customerid where " +
                    "Customer.CustomerName = '" + HttpUtility.HtmlEncode(customer) + "'";
            }
            

            SqlConnection sqlConnect = new SqlConnection(constr);

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


            SqlConnection sqlConnect = new SqlConnection(constr);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable InventoryGridview = new DataTable();

            sqlAdapter.Fill(InventoryGridview);

            grdInventory.DataSource = InventoryGridview;
            grdInventory.DataBind();
        }
    }
}