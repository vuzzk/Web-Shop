using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class adduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            WebShop unos_korisnika = new WebShop();
            int rezultat_kategorija = unos_korisnika.Unos_Korisnika(txtName.Text, txtSurname.Text, txtUsername.Text, txtPassword.Text, txtMail.Text, txtCountry.Text, txtCity.Text, Convert.ToInt32(txtPostcode.Text), txtAdress.Text, 4);


            if (rezultat_kategorija == 0)
            {
                successMessage.Visible = true;
                txtSurname.Text = "";
                txtName.Text = "";
                txtUsername.Text = "";
                txtMail.Text = "";
                txtPassword.Text = "";
                txtCountry.Text = "";
                txtCity.Text = "";
                txtPostcode.Text = "";
                txtAdress.Text = "";
            }
            else
            {
                failureMessage.Visible = true;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            failureMessage.Visible = false;
            successMessage.Visible = false;
        }
    }
}