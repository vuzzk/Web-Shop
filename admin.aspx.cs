using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtopis_kat_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_kategorija_Click(object sender, EventArgs e)
        {
            WebShop unos_kategorije = new WebShop();
            int rezultat_kategorija = unos_kategorije.Unos_Kategorija(txtkategorija.Text, txtopis_kat.Text,txtslika.Text );


            if (rezultat_kategorija==0)
            {
                Response.Write("ok");

            }
            else
            {
                Response.Write("ne");
            }

        }

        protected void btn_proizvoda_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            WebShop unos_proizvoda = new WebShop();
            int rezultat_proizvod = unos_proizvoda.Unos_Proizvoda(txtimeproizvoda.Text, txtsifraporizvoda.Text, Convert.ToInt32(txtcenaproizvoda.Text), Convert.ToInt32(txtkolicinaproizvoda.Text), txtproizvodjacproizvoda.Text, Convert.ToInt32(DropDownList1.SelectedItem.Value));


            if (rezultat_proizvod == 0)
            {
                Session["sifra_proizvoda"] = txtsifraporizvoda.Text;


            }
            else
            {
                Response.Write("ne");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            WebShop unos_opisa = new WebShop();
            int rezultat_opis = unos_opisa.Unos_Opisa(txtopis.Text, Session["sifra_proizvoda"].ToString(), img_opis.Text, img_opis.Text, img_opis.Text, img_opis.Text);


            if (rezultat_opis == 0)
            {
                Response.Write("opis unet");


            }
            else
            {
                Response.Write("ne");
            }
        }
    }
}