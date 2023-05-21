using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class cart : System.Web.UI.Page
    {
        decimal total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartItems();
                CalculateAndDisplayCartTotal();
            }
        }

        protected void BindCartItems()
        {
            if (Session["Cart"] != null)
            {
                DataTable cartItems = (DataTable)Session["Cart"];
                gvCart.DataSource = cartItems;
                gvCart.DataBind();
            }
        }

        protected decimal CalculateTotalPrice()
        {
            decimal totalPrice = 0;
            if (Session["Cart"] != null)
            {
                DataTable cartItems = (DataTable)Session["Cart"];
                foreach (DataRow row in cartItems.Rows)
                {
                    decimal price = Convert.ToDecimal(row["Price"]);
                    int quantity = Convert.ToInt32(row["Quantity"]);
                    totalPrice += price * quantity;
                }
            }
            return totalPrice;
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalPrice = (Label)e.Row.FindControl("lblTotalPrice");
                if (lblTotalPrice != null)
                {
                    lblTotalPrice.Text = CalculateTotalPrice().ToString("C");
                }
            }
        }

        protected void CalculateAndDisplayCartTotal()
        {
            decimal cartTotal = CalculateCartTotal();
            lblTotalPrice.Text = cartTotal.ToString("C");
        }

        protected decimal CalculateCartTotal()
        {
            decimal cartTotal = 0;
            if (Session["Cart"] != null)
            {
                DataTable cartItems = (DataTable)Session["Cart"];
                foreach (DataRow row in cartItems.Rows)
                {
                    decimal price = Convert.ToDecimal(row["Price"]);
                    int quantity = Convert.ToInt32(row["Quantity"]);
                    cartTotal += price * quantity;
                }
            }
            return cartTotal;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (sender is Button btnRemove)
            {
                string productID = btnRemove.CommandArgument.ToString();
                RemoveItemFromCart(productID);
            }
        }

        private void RemoveItemFromCart(string SKU)
        {
            if (Session["Cart"] != null)
            {
                DataTable cartItems = (DataTable)Session["Cart"];

                DataRow[] rowsToRemove = cartItems.Select("SKU = '" + SKU + "'");

                foreach (DataRow rowToRemove in rowsToRemove)
                {
                    cartItems.Rows.Remove(rowToRemove);
                }

                Session["Cart"] = cartItems;

                BindCartItems();

                CalculateAndDisplayCartTotal();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["cartTotal"] = CalculateCartTotal();
            Response.Redirect("checkout.aspx");
        }
    }
}