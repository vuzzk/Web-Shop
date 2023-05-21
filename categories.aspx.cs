using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string ime = btnEdit.CommandArgument;
            Session["EditCategoryName"] = ime;
            Response.Redirect("editcategory.aspx");

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string ime = btnDelete.CommandArgument;

            WebShop brisanje_kategorije = new WebShop();
            int rezultat_kat = brisanje_kategorije.Brisanje_Kategorije(ime);

            if (rezultat_kat == 0)
            {
                successMessageDelete.Visible = true;
                Response.Redirect("categories.aspx");
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