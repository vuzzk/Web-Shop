using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSeeDetails_Click(object sender, EventArgs e)
        {
            Button btnSeeDetails = (Button)sender;
            int broj_porudzbine = Convert.ToInt32(btnSeeDetails.CommandArgument);
            Session["OrderDetails"] = broj_porudzbine;
            
            Response.Redirect("orderdetails.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}