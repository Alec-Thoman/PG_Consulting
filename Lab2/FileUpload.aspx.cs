using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
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

                    string from = "GreenValleyServices2021@gmail.com";
                    string to = "thomanac@dukes.jmu.edu";
                    sendEmail(from, to);
                    
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
            //CreateDirectoryIfNotExists(newDirectory);
            //Calling the function to create new directory

            if (FileUpload1.HasFile)
            {
                CreateDirectoryIfNotExists(newDirectory);
                FileUpload1.SaveAs(newDirectory + "/" + FileUpload1.FileName);
                fileStatus.Text = "Image/File Uploaded Successfully!";

            }
            else
            {
                fileStatus.Text = "Select image/file first !!";
            }
        }

        protected void HomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHomePage.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("CustomerLoginPageBStrap.aspx?loggedout=true");
        }

        private void sendEmail(string fromEmail, string toEmail)
        {
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Port = 587;
            //string fromEmail = "GreenValleyServices2021@gmail.com"; // created this gmail for this as the sole purpose
            smtpClient.Credentials = new System.Net.NetworkCredential(fromEmail, "GoDukes2021");
            smtpClient.EnableSsl = true;

            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(fromEmail);
            //mailMessage.To.Add("thomanac@dukes.jmu.edu");
            mailMessage.To.Add(toEmail);
            mailMessage.Subject = "New Customer Alert!!";
            mailMessage.Body = "Please check for new customer file created in the system.";
            try
            {
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                //Error
                //Console.WriteLine(ex.Message);
                Response.Write(ex.Message);
            }
        }
    }
}