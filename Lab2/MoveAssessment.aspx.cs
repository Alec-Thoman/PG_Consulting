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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string preliminarySql = "insert into Preliminary
            //string roomSql = "insert into Room 
            //string infoSql = "insert into SpecificInfo 
            //string costSql = "insert into Cost
             
            try
            {
                using (var connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString))
                {
                    connection.Open();
                    // insert into LookAt Table
                    using (SqlCommand command = new SqlCommand(preliminarySql, connection))
                    {
                        
                    }

                    // insert into box table
                    using (SqlCommand cmd = new SqlCommand(roomSql, connection))
                    {
                        connection.Open();

                        
                        string empty = "0";
                        if (TextBox79.Equals(""))
                        {
                            cmd.Parameters.Add
                        else
                        {
                            cmd.Parameters.Add
                        }

                        if (TextBox80.Equals(""))
                        {
                            cmd.Parameters.Add
                        else
                        {
                            cmd.Parameters.Add

                        if (TextBox81.Equals(""))
                        {
                            cmd.Parameters.Add
                        }
                        else
                        {
                            cmd.Parameters.Add
                        }

                        if (TextBox82.Equals(""))
                        {
                            cmd.Parameters.Add
                        else
                        {
                            cmd.Parameters.Add

                        if (TextBox83.Equals(""))
                        {
                            cmd.Parameters.Add
                        }
                        else
                        {
                            cmd.Parameters.Add

                        if (TextBox84.Equals(""))
                        {
                            cmd.Parameters.Add
                        }
                        else
                        {
                            cmd.Parameters.Add
                        }

                        cmd.ExecuteNonQuery();
                        connection.Close();

                         using (SqlCommand command = new SqlCommand(infoSql, connection))
                         {

                         }

                        using (SqlCommand command = new SqlCommand(costSql, connection))
                        {

                        }
                                            }
                }
            }
        }
    }
}
