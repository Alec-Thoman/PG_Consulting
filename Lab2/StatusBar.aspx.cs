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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateGridView();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String name = txtName.Text;
            String status = txtStatus.Text;
            String a = "";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            String sqlIDQuery = "Select CustomerName from ClientStatus";
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlIDQuery;

            sqlConnect.Open();

            SqlDataReader Results = sqlCommand1.ExecuteReader();

            while (Results.Read())
            {
                if (name.ToLower() == Results["CustomerName"].ToString().ToLower())
                {
                    Results.Close();
                    String sqlQuery1 = "Update ClientStatus set Status = '"+ status + "' where CustomerName = '" + name +"';";


                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlQuery1;


                    SqlDataReader queryResults1 = sqlCommand2.ExecuteReader();
                    queryResults1.Close();
                    updateGridView();
                    break;
                }

                else
                {
                    string sqlQuery2 = "Insert into clientStatus(customerName, status) value ('" + name + "','" + status + "')";

                    SqlCommand sqlCommand2 = new SqlCommand();
                    sqlCommand2.Connection = sqlConnect;
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlCommand2.CommandText = sqlQuery2;

                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand2.ExecuteReader();
                    queryResults.Close();
                    sqlConnect.Close();

                }
           

            

        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }


        protected void updateGridView()
        {
            grdCustomerStatus.DataSource = null;
            grdCustomerStatus.DataBind();

            String sqlQuery = "SELECT CustomerName as Name_Client, Status from ClientStatus";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable workflowGridview = new DataTable();

            sqlAdapter.Fill(workflowGridview);

            grdCustomerStatus.DataSource = workflowGridview;
            grdCustomerStatus.DataBind();
        }
    }
}