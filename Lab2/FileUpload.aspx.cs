using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void CreateDirectoryIfNotExists(string NewDirectory)
        {
            try
            {
                // Checking the existence of directory
                if (!Directory.Exists(NewDirectory))
                {
                    //If no directory then creates the new one
                    Directory.CreateDirectory(NewDirectory);
                    //Label1.Text = "Directory Created";
                }
                else
                {
                    //Label1.Text = "Directory Exists";
                }
            }
            catch (IOException _err)
            {
                Response.Write(_err.Message);
            }
        }

        protected void fileUploadbtn_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"].ToString();
            string newDirectory = "C:/Users/alect/Desktop/" + username; // change this to proper aws path when aws is setup
            //New Directory Name in string variable
            CreateDirectoryIfNotExists(newDirectory);
            //Calling the function to create new directory

            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(newDirectory + "/" + FileUpload1.FileName);
                Label2.Text = "Image/File Uploaded Successfully!";
            }
            else
            {
                Label2.Text = "Select image/file first !!";
            }
        }

        protected void HomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHomePage.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("CustomerLoginPage.aspx?loggedout=true");
        }
    }
}