using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class editproduct : System.Web.UI.Page
    {
        string sku;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sku = Session["EditProductSKU"].ToString();
                WebShop izmeni_proizvod = new WebShop();
                DataSet userData = izmeni_proizvod.Proizvod(sku);

                if (userData != null && userData.Tables.Count > 0 && userData.Tables[0].Rows.Count > 0)
                {
                    DataRow userRow = userData.Tables[0].Rows[0];

                    txtName.Text = userRow["ime"].ToString();
                    txtSKU.Text = userRow["sifra"].ToString();
                    txtPrice.Text = userRow["cena"].ToString();
                    txtQuantity.Text = userRow["kolicina"].ToString();
                    txtManufacturer.Text = userRow["proizvodjac"].ToString();
                    DropDownListCat.SelectedValue = userRow["kategorija_id"].ToString();
                    txtDescription.Text = userRow["tekst_opisa"].ToString();

                    string imageUrl = GetProductImage(sku);
                    imgProduct.ImageUrl = imageUrl;
                    Session["ProductImage"] = imageUrl;
                }

            }

        }

        protected string GetProductImage(string productSKU)
        {
            if (productSKU != null)
            {
                WebShop slika = new WebShop();
                string imageUrl = slika.Slika_Proizvoda(productSKU);

                return imageUrl;
            }
            return string.Empty;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string product_sku = txtSKU.Text;
            int price = Convert.ToInt32(txtPrice.Text);
            int quantity = Convert.ToInt32(txtQuantity.Text);
            string manufacturer = txtManufacturer.Text;
            int category_id = Convert.ToInt32(DropDownListCat.SelectedItem.Value);
            string description = txtDescription.Text;
            string image = Session["ProductImage"].ToString();

            string filePath = string.Empty;
            if (fileProductImage.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(fileProductImage.FileName);
                if (fileextension.ToLower() != ".png")
                {
                    lblError.Visible = true;
                    lblError.Text = "Slika nije u .png formatu!";
                }
                else
                {
                    int filesize = fileProductImage.PostedFile.ContentLength;
                    if (filesize > 2242880)
                    {
                        lblError.Visible = true;
                        lblError.Text = "Slika je previše velika!";
                    }
                    else
                    {
                        fileProductImage.SaveAs(Server.MapPath("./Uploads/" + fileProductImage.FileName));
                        image = "./Uploads/" + fileProductImage.FileName;
                    }
                }
            }


            WebShop proizvod = new WebShop();
            int izmena_proizvoda = proizvod.Izmena_Proizvoda(name, product_sku, price, quantity, manufacturer, category_id);

            if (izmena_proizvoda == 0)
            {
                lblError.Text = "Podaci uspešno izmenjeni";
                lblError.CssClass = "text-success";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Greška! Proverite da li su uneti podaci u tačnom formatu.";
                lblError.CssClass = "text-danger";
                lblError.Visible = true;
            }

            WebShop opis = new WebShop();
            int izmena_opisa = opis.Izmena_Opisa(description, product_sku, image, image, image, image);

            if (izmena_opisa == 0)
            {
                Session["EditProductSKU"] = product_sku;
                Response.Redirect("editproduct.aspx");
            }
            else
            {
                lblError.Text = "Greška! Proverite da li su uneti podaci u tačnom formatu.";
                lblError.CssClass = "text-danger";
                lblError.Visible = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("products.aspx");
            Session["EditProductSKU"] = null;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

    }
}