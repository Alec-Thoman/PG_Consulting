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
            sendEmail("GreenValleyServices2021@gmail.com", emailTB.Text);
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
            mailMessage.Subject = subjectTB.Text;
            mailMessage.Body = Request.Form["bodyTA"].ToString();
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