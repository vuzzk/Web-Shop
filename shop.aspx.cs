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

        protected void lvCategories_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "CategoryClick")
            {
                string categoryName = e.CommandArgument.ToString();
                // Perform the desired action based on the clicked category
                // For example, you can call a method or redirect to a different page
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // TODO: Implement search functionality
        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            // TODO: Implement category filtering
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // TODO: Implement adding a product to the cart
        }
    }
}