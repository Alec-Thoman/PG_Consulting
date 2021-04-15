using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CustomerInfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["customerName"].ToString();
            emailTB.Text = email;
        }

        protected void editButton_Click(object sender, EventArgs e)
        {

        }
    }
}