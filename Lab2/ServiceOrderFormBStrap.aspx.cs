using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class ServiceOrderFormBStrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceID = int.Parse(ServiceList.SelectedValue);
            if (serviceID == 2)
            {
                addressLbl.InnerText = "Origin Address:";
                destinationLbl.Visible = true;
                destinationTxt.Visible = true;

            }

            else
            {
                addressLbl.InnerText = "Address:";
                destinationLbl.Visible = false;
                destinationTxt.Visible = false;
            }
        }
    }
}