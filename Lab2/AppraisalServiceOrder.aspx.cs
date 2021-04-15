using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class AppraisalServiceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            if (addtlServicesrl.SelectedItem.Text.Equals("Yes"))
            {
                // somehow pull up page with links to MoveAssessment Form and AuctionAssessment Form
            }
        }
    }
}