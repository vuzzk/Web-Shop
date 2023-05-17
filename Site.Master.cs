using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class Site : System.Web.UI.MasterPage
    {
        string mail = "";
        bool signed = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    btnCart.Visible = true;
                    btnMyAccount.Visible = true;
                    btnSignIn.Visible = false;

                    mail = Session["mail"].ToString();
                    signed = true;
                }
                else
                {
                    btnCart.Visible = false; ;
                    btnMyAccount.Visible = false;
                    btnSignIn.Visible = true;
                }
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {

        }

        protected void btnMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("myaccount.aspx");
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}