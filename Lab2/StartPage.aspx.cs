using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EmployeeSignin_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLoginPageBStrap.aspx");
        }

        protected void CustomerSignin_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLoginPage.aspx");
        }

        protected void CustomerSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }
    }
}