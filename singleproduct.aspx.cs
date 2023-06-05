using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Web_Shop
{
    public partial class singleproduct : System.Web.UI.Page
    {
        string sku;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sifra"] != null)
                {
                    sku = Request.QueryString["sifra"];

                    WebShop proizvod_single = new WebShop();
                    DataSet userData = proizvod_single.Proizvod_Single(sku);

                    if (userData != null && userData.Tables.Count > 0 && userData.Tables[0].Rows.Count > 0)
                    {
                        DataRow userRow = userData.Tables[0].Rows[0];

                        lblProductName.InnerText = userRow["ime"].ToString();
                        lblSKU.InnerText = userRow["sifra"].ToString();
                        lblPrice.InnerText = userRow["cena"].ToString();
                        txtQuantity.Text = "1";
                        lblManufacturer.InnerText = userRow["proizvodjac"].ToString();
                        lblCategory.InnerText = userRow["kategorija"].ToString();
                        lblDescription.InnerText = userRow["tekst_opisa"].ToString();

                        string imageUrl = GetProductImage(sku);
                        imgProduct.ImageUrl = imageUrl;
                        Session["ProductImage"] = imageUrl;
                    }
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            WebShop kolicina = new WebShop();
            int rezultat = kolicina.Kolicina_Dostupna(lblSKU.InnerText, Convert.ToInt32(txtQuantity.Text));
            if (rezultat == 0)
            {
                if (Session["Cart"] == null)
                {
                    // Kreiraj novi DataTable za stavke korpe
                    DataTable cartItems = new DataTable();
                    cartItems.Columns.Add("Name");
                    cartItems.Columns.Add("SKU");
                    cartItems.Columns.Add("Price", typeof(decimal));
                    cartItems.Columns.Add("Quantity", typeof(int));

                    // Zapamti Datable 
                    Session["Cart"] = cartItems;
                }

                // Uzmi detalje proizvoda
                string name = lblProductName.InnerText;
                string sku = lblSKU.InnerText;
                decimal price = Convert.ToDecimal(lblPrice.InnerText);
                int quantity = GetQuantity();

                // Uzmi podatke o korpi iz sesije
                DataTable cartItemsTable = (DataTable)Session["Cart"];

                // Proveri da li je proizvod već u korpi
                DataRow[] existingRows = cartItemsTable.Select("SKU = '" + sku + "'");
                if (existingRows.Length > 0)
                {
                    // Ažuriraj količinu proizvoda
                    existingRows[0]["Quantity"] = Convert.ToInt32(existingRows[0]["Quantity"]) + quantity;
                }
                else
                {
                    // Dodaj novi proizvod u korpu
                    DataRow newRow = cartItemsTable.NewRow();
                    newRow["Name"] = name;
                    newRow["SKU"] = sku;
                    newRow["Price"] = price;
                    newRow["Quantity"] = quantity;
                    cartItemsTable.Rows.Add(newRow);
                }

                // Zapamti ažuriranu korpu
                Session["Cart"] = cartItemsTable;

                Response.Redirect("cart.aspx");
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Nemamo toliku količinu proizvoda u zalihama";
            }
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            int quantity = GetQuantity();
            quantity++;
            SetQuantity(quantity);
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            int quantity = GetQuantity();
            if (quantity > 1)
            {
                quantity--;
                SetQuantity(quantity);
            }
        }

        private int GetQuantity()
        {
            int quantity = 1;
            int.TryParse(txtQuantity.Text, out quantity);
            return quantity;
        }

        private void SetQuantity(int quantity)
        {
            txtQuantity.Text = quantity.ToString();
        }

        protected DataTable CreateCartDataTable()
        {
            DataTable cart = new DataTable();
            cart.Columns.Add("SKU", typeof(string));
            cart.Columns.Add("ProductName", typeof(string));
            cart.Columns.Add("Price", typeof(decimal));
            cart.Columns.Add("Quantity", typeof(int));
            return cart;
        }
    }
}