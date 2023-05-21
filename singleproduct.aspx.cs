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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the product ID is provided in the query string
                if (Request.QueryString["sifra"] != null)
                {
                    string sku = Request.QueryString["sifra"];

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
            // Check if the Cart exists in the session
            if (Session["Cart"] == null)
            {
                // Create a new DataTable to store cart items
                DataTable cartItems = new DataTable();
                cartItems.Columns.Add("Name");
                cartItems.Columns.Add("SKU");
                cartItems.Columns.Add("Price", typeof(decimal));
                cartItems.Columns.Add("Quantity", typeof(int));

                // Add the DataTable to the session
                Session["Cart"] = cartItems;
            }

            // Get the selected product details
            string name = lblProductName.InnerText;
            string sku = lblSKU.InnerText;
            decimal price = Convert.ToDecimal(lblPrice.InnerText);
            int quantity = GetQuantity();

            // Retrieve the cart DataTable from the session
            DataTable cartItemsTable = (DataTable)Session["Cart"];

            // Check if the product is already in the cart
            DataRow[] existingRows = cartItemsTable.Select("SKU = '" + sku + "'");
            if (existingRows.Length > 0)
            {
                // Update the quantity of the existing product
                existingRows[0]["Quantity"] = Convert.ToInt32(existingRows[0]["Quantity"]) + quantity;
            }
            else
            {
                // Add the new product to the cart
                DataRow newRow = cartItemsTable.NewRow();
                newRow["Name"] = name;
                newRow["SKU"] = sku;
                newRow["Price"] = price;
                newRow["Quantity"] = quantity;
                cartItemsTable.Rows.Add(newRow);
            }

            // Update the session with the modified cart DataTable
            Session["Cart"] = cartItemsTable;

            // Redirect to the cart page
            Response.Redirect("cart.aspx");
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