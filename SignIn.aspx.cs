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


            string email = txtEmail.Text;
            string password = txtPassword.Text;

            rezultat = _login.Provera_Admina(email, password);

            if (rezultat == 0)
            {
                Session["LoggedIn"] = true;
                Session["mail"] = email;

                Response.Redirect("home.aspx");
            }
            else
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Netačni mejl ili lozinka. Probajte ponovo.";
            }
        }
    }
}