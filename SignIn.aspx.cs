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
            int role;

            string email = txtEmail.Text;
            string password = txtPassword.Text;

            rezultat = _login.Provera_Korisnika(email, password);

            WebShop _login2 = new WebShop();
            role = _login2.Uloga_Korisnika(email);

            if (rezultat == 0)
            {
                Session["LoggedIn"] = true;
                Session["mail"] = email;
                Session["role"] = role;

                if (role == 2)
                {
                    Response.Redirect("adminhome.aspx");
                }
                else
                {
                    Response.Redirect("home.aspx");
                }               
            }
            else
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Netačni mejl ili lozinka. Probajte ponovo.";
            }
        }
    }
}