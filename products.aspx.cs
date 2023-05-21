using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string sifra = btnEdit.CommandArgument;
            Session["EditProductSKU"] = sifra;
            Response.Redirect("editproduct.aspx");

        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string sifra = btnDelete.CommandArgument;

            WebShop brisanje_proizvoda = new WebShop();
            int rezultat_proizvod = brisanje_proizvoda.Brisanje_Proizvoda(sifra);
            int rezultat_opis = brisanje_proizvoda.Brisanje_Opisa(sifra);

            if (rezultat_proizvod == 0 && rezultat_opis == 0)
            {
                successMessageDelete.Visible = true;
                Response.Redirect("products.aspx");
            }
            else
            {

            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            successMessageDelete.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}