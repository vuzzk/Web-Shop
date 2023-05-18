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
        int role = -1;
        bool signed = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    mail = Session["mail"].ToString();
                    role = (int)Session["role"];
                    Session["user_role"] = role;
                    signed = true;
                }
                else
                {
                    
                }
            }
            
        }
    }
}