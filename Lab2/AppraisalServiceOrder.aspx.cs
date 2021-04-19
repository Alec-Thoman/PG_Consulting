using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class AppraisalServiceOrder : System.Web.UI.Page
    {
        string constr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["InitialInfoID"] = 1;
            // grabs cust fn and ln as well as creation date from db
            string fn = "";
            string ln = "";
            string initDate = "";
            int initialInfoID = Convert.ToInt32(Session["InitialInfoID"]);
            if (Session["InitialInfoID"] != null)
            {
                initialInfoID = Convert.ToInt32(Session["InitialInfoID"]);
            }

            //if (Session["DBSource"].Equals("AWS"))
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;
            //}
            //else
            //{
            //    constr = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            //}

            constr = WebConfigurationManager.ConnectionStrings["AWSLab3"].ConnectionString;


            SqlConnection sqlConnect = new SqlConnection(constr);
            string initialInfoQuery = "select FirstName, LastName, InitialDate from InitialInfo where InitialInfoID = @ID";

            SqlCommand cmd = new SqlCommand(initialInfoQuery, sqlConnect);
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = initialInfoID;
            sqlConnect.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    fn = (string)reader["FirstName"];
                    ln = (string)reader["LastName"];
                    initDate = (string)reader["InitialDate"];
                }
            }
            custNamelbl.Text = fn + " " + ln;
            createAccountDatelbl.Text = "Created Account: " + initDate;

            // makes deadline tb appear if yes is selected
            if (deadlineYesRB.Checked)
            {

                labelDeadline.Visible = true;
                deadlineTB.Visible = true;
            } else
            {
                labelDeadline.Visible = false;
                deadlineTB.Visible = false;
            }
            sqlConnect.Close();
        }

        protected void moveassessmentbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveAssessment.aspx");
        }

        protected void uploadAppraisalButton_Click(object sender, EventArgs e)
        {
            int AppraisalServiceOrderID = 0;
            SqlConnection sqlConnect = new SqlConnection(constr);
            sqlConnect.Open();

            string appraisalServiceOrderInsert = "insert into AppraisalServiceOrder([Deadline],[AppraisalSize],[Inventory]) values (@Deadline,@AppraisalSize,@Inventory);SELECT CAST(scope_identity() AS int)";

            SqlCommand cmd2 = new SqlCommand(appraisalServiceOrderInsert, sqlConnect);

            cmd2.Parameters.Add("@Deadline", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(deadlineTB.Text);
            cmd2.Parameters.Add("@AppraisalSize", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(appraisalSizeTB.Text);
            cmd2.Parameters.Add("@Inventory", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(inventoryTA.Value.ToString());

            AppraisalServiceOrderID = (int)cmd2.ExecuteScalar();

            // for appraisalpurp table
            string appraisalPurposeInsert = "insert into AppraisalPurpose([Purpose], [AppraisalServiceOrderID]) " +
                "values(@Purpose,@AppraisalServiceOrderID)";

            SqlCommand cmd = new SqlCommand(appraisalPurposeInsert, sqlConnect);
            string purpose = "";
            if (estateappraisalCB.Checked)
            {
                purpose = " Estate Appraisal";
            } else if (familyappraisalCB.Checked)
            {
                purpose += " Family Appraisal";
            }
            cmd.Parameters.Add("@Purpose", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(purpose);
            cmd.Parameters.Add("@AppraisalServiceOrderID", SqlDbType.Int).Value = AppraisalServiceOrderID;

            cmd.ExecuteNonQuery();

            // for invoice table
            string appraisalServiceInvoiceInsert = "insert into AppraisalServiceInvoice([ContactName],[AppraisalName]," +
                "[SendAppraisalAddress],[AppraisalDate],[AppraisalCost],[PaymentSection],[AppraisalServiceOrderID], [InitialInfoID]) values" +
                "(@ContactName,@AppraisalName,@SendAddress,@AppraisalDate,@AppraisalCost,@PaymentSection,@AppraisalServiceOrderID, @InitialInfoID)";

            SqlCommand cmd3 = new SqlCommand(appraisalServiceInvoiceInsert, sqlConnect);

            cmd3.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(contactNameTB.Text);
            cmd3.Parameters.Add("@AppraisalName", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(apprNameTB.Text);
            cmd3.Parameters.Add("@SendAddress", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(sendToAddressTB.Text);
            cmd3.Parameters.Add("@AppraisalDate", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(appraisalDateTB.Text);
            cmd3.Parameters.Add("@AppraisalCost", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(appraisalCostTB.Text);
            cmd3.Parameters.Add("@PaymentSection", SqlDbType.VarChar).Value = HttpUtility.HtmlEncode(paymentsectTA.Value.ToString());
            cmd3.Parameters.Add("@AppraisalServiceOrderID", SqlDbType.Int).Value = AppraisalServiceOrderID;
            cmd3.Parameters.Add("@InitialInfoID", SqlDbType.Int).Value = Convert.ToInt32(Session["InitialInfoID"]);

            cmd3.ExecuteNonQuery();
        }

        protected void emailButton_Click(object sender, EventArgs e)
        {
            if (!sendToAddressTB.Text.Equals(""))
            {
                sendEmail("GreenValleyServices2021@gmail.com", HttpUtility.HtmlEncode(sendToAddressTB.Text));
                //reqStatus.Text = "Contact request successfully sent!";
            }
            else
            {
                //reqStatus.Text = "Please fill out all boxes and try again";
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
            mailMessage.Subject = "Green Valley Auctions Invoice";

            // Adding all fields to email body

            //mailMessage.Body = Request.Form["bodyTA"].ToString();
            mailMessage.Body = "This is the invoice for your " + apprNameTB.Text + "\n" + "AppraisalDate: " + appraisalDateTB.Text + "\n" + "Cost of Appraisal: $" + appraisalCostTB.Text + "\n" + "Contact Name: " + contactNameTB.Text + "\n" + "Payment Section: " + paymentsectTA.Value;
                //servDeadline;
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

        protected void btnPopulateAppraisal_Click(object sender, EventArgs e)
        {
            estateappraisalCB.Checked = true;
            deadlineYesRB.Checked = true;
            inventoryTA.Value = "3 Vases, 20 China Plates";
            deadlineTB.Text = "9/18/2021";
            appraisalSizeTB.Text = "100";
            contactNameTB.Text = "Andrew Wilson";
            apprNameTB.Text = "Appraisal1";
            sendToAddressTB.Text = "102 Hamilton Rd";

        }
    }
}