using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class addcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string filePath = string.Empty;
            if (fileCategoryImage.HasFile)
            {
                filePath = Server.MapPath("~/Resources/") + fileCategoryImage.FileName;
                fileCategoryImage.SaveAs(filePath);
            }

            WebShop unos_kategorije = new WebShop();
            int rezultat_kategorija = unos_kategorije.Unos_Kategorija(txtCategoryName.Text, txtCategoryDesc.Text, filePath);
            

            if (rezultat_kategorija == 0)
            {
                successMessage.Visible = true;
                txtCategoryName.Text = "";
                txtCategoryDesc.Text = "";
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