using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class about : System.Web.UI.Page
    {
        int products;
        int users;

        protected void Page_Load(object sender, EventArgs e)
        {
            WebShop about = new WebShop();

            products = about.Broj_Proizvoda();
            users = about.Broj_Korisnika();

            lblProductCount.Text = products.ToString();
            lblUserCount.Text = users.ToString();
        }
    }
}