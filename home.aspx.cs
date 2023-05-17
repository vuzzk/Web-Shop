using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class home : System.Web.UI.Page
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
                    mail = Session["mail"].ToString();
                    signed = true;
                }
                else
                {
                    
                }
            }
        }
    }
}