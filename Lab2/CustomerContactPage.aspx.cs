using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CustomerContactPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendClick(object sender, EventArgs e)
        {
            if (!emailTB.Text.Equals(""))
            {
                sendEmail("GreenValleyServices2021@gmail.com", HttpUtility.HtmlEncode(emailTB.Text));
                reqStatus.Text = "Contact request successfully sent!";
            }
            else
            {
                reqStatus.Text = "Please fill out all boxes and try again";
            }
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
            //mailMessage.Subject = subjectTB.Text;
            mailMessage.Subject = "Customer Request!";

            // Adding all fields to email body
            string customerName = nameTB.Text + " " + lnameTB.Text;
            string custPhone = phoneTB.Text;
            string hearAbout = hearAboutTB.Text;
            string serviceReq = servReqTB.Text;
            string contactPref = contPrefTB.Text;
            string servDeadline = servDeadlineTB.Text;
            //mailMessage.Body = Request.Form["bodyTA"].ToString();
            mailMessage.Body = "Name: " + customerName + "\n" + "Primary Phone: " + custPhone + "\n" + "Hear About Us: " + hearAbout + "\n" + "Service Requested: " + serviceReq + "\n" + "Contact Preference: " + contactPref + "\n" + "Service Deadline: " +
                servDeadline;
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