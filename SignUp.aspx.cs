using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                part1.Visible = false;
                part2.Visible = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                part1.Visible = true;
                part2.Visible = false;
            }
        }
    }
}