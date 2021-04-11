using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                state.ForeColor = Color.Green;
                state.Font.Bold = true;
                state.Text = HttpUtility.HtmlEncode(Session["UserName"]).ToString() + " Online";
            }

            else
            {
                state.Text = "";
            }
        }
    }
}