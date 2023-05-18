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
            int role = 4;
            string email = txtEmail.Text;

            WebShop unos_korisnika = new WebShop();
            int rezultat_kategorija = unos_korisnika.Unos_Korisnika(txtName.Text, txtSurname.Text, txtUsername.Text, txtPassword.Text, txtEmail.Text, txtCountry.Text, txtCity.Text, Convert.ToInt32(txtPostCode.Text), txtAdress.Text, role);

            if (rezultat_kategorija == 0)
            {
                txtSurname.Text = "";
                txtName.Text = "";
                txtUsername.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtCountry.Text = "";
                txtCity.Text = "";
                txtPostCode.Text = "";
                txtAdress.Text = "";

                Session["LoggedIn"] = true;
                Session["mail"] = email;
                Session["role"] = role;
                Response.Redirect("home.aspx");
            }
            else
            {
                failureMessage.Visible = true;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            part1.Visible = false;
            part2.Visible = true;

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            part1.Visible = true;
            part2.Visible = false;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            failureMessage.Visible = false;
        }
    }
}