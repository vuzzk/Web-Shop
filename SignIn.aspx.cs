using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            WebShop _login = new WebShop();
            int rezultat;

            rezultat = _login.Provera_Admina(txtEmail.Text, txtPassword.Text);

            if (rezultat == 0)
            {
                Response.Redirect("admin.aspx");
            }
            else
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Netačni mejl ili lozinka. Probajte ponovo.";
            }
        }
    }
}