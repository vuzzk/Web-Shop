using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetProductImage(object productSKUEval)
        {
            if (productSKUEval != null)
            {
                string productSKU = productSKUEval.ToString();
                
                WebShop slika = new WebShop();
                string imageUrl = slika.Slika_Proizvoda(productSKU);

                return imageUrl;
            }
            return string.Empty;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(searchText))
            {
                SqlDataSourceProducts.SelectCommand = "SELECT Ime, Sifra, Cena, Kategorija FROM ProdavnicaPrikaz";
                SqlDataSourceProducts.SelectParameters.Clear();
            }
            else
            {
                SqlDataSourceProducts.SelectCommand = "SELECT Ime, Sifra, Cena, Kategorija FROM ProdavnicaPrikaz WHERE Ime LIKE '%' + @searchText + '%' OR Sifra LIKE '%' + @searchText + '%' OR Kategorija LIKE '%' + @searchText + '%'";
                SqlDataSourceProducts.SelectParameters.Clear();
                SqlDataSourceProducts.SelectParameters.Add("searchText", searchText);
            }

            rptProducts.DataBind();
        }

        protected void btnSeeProduct_Click(object sender, EventArgs e)
        {
            Button btnSeeProduct = (Button)sender;

            RepeaterItem item = (RepeaterItem)btnSeeProduct.NamingContainer;

            string sifra = (string)btnSeeProduct.CommandArgument;

            Response.Redirect("singleproduct.aspx?sifra=" + sifra);
        }


        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewProduct")
            {
                string sifra = e.CommandArgument.ToString();
                Response.Redirect("singleproduct.aspx?sifra=" + sifra);
            }
        }
    }
}