using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void employeeSignInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLoginPageBStrap.aspx");
        }

        protected void customerSignInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLoginPageBStrap.aspx");
        }

        //protected void signupButton_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("NewCustomer.aspx");
        //}
    }
}