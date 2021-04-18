using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tableauButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TableauVisualization.aspx");
        }

        protected void upcomingSvcBtn_Click(object sender, EventArgs e)
        {
            
        }
    }
}