using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CustomerHomePageBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logoLogoutClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("CustomerLoginPageBStrap.aspx?loggedout=true");
        }
    }
}