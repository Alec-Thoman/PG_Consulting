using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CustomerNewService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String email = "";
            String uname = "";
            email = Session["UserName"].ToString();
            uname = email.Substring(0, email.IndexOf("@"));
            nameTB.Text = uname; // set name box to name of user logged in
            openDateTB.Text = DateTime.Now + ""; // sets open ticket date to current date
        }
    }
}