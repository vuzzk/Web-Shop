using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Web_Shop
{
    public partial class checkout : System.Web.UI.Page
    {
        string mail;
        decimal cartTotal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                cartTotal = (decimal)Session["cartTotal"];
                lblTotalAmount.Text = cartTotal.ToString() + " €";

                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    mail = Session["Mail"].ToString();
                    WebShop nalog = new WebShop();
                    DataSet userData = nalog.Korisnik(mail);
                    if (userData != null && userData.Tables.Count > 0 && userData.Tables[0].Rows.Count > 0)
                    {
                        DataRow userRow = userData.Tables[0].Rows[0];

                        txtName.Text = userRow["ime"].ToString();
                        txtSurname.Text = userRow["prezime"].ToString();
                        txtEmail.Text = userRow["email"].ToString();
                        txtCountry.Text = userRow["grad"].ToString();
                        txtCity.Text = userRow["drzava"].ToString();
                        txtPostalCode.Text = userRow["postanski_br"].ToString();
                        txtAddress.Text = userRow["adresa"].ToString();
                    }
                }              
            }
        }

        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            WebShop porudzbina = new WebShop();
            int broj_racuna = porudzbina.Kreiraj_Porudzbinu(txtEmail.Text, Convert.ToInt32(Session["cartTotal"]), "DA", txtDesc.Text);

            if (broj_racuna > 0)
            {
                DataTable cartItems = (DataTable)Session["Cart"];
                bool allItemsInserted = true;  // Track overall success or failure of insertions

                foreach (DataRow row in cartItems.Rows)
                {
                    string SKU = row["SKU"].ToString();
                    int quantity = Convert.ToInt32(row["Quantity"]);

                    int stavkaPorudzbineResult = porudzbina.Stavka_Porudzbine(broj_racuna, SKU, quantity);
                    if (stavkaPorudzbineResult == 2)
                    {
                        allItemsInserted = false;
                        labelError.Visible = true;
                        labelError.Text = "Nemamo toliku količinu proizvoda u zalihama";
                        break;
                        
                    }
                    if (stavkaPorudzbineResult == 1)
                    {
                        allItemsInserted = false;
                        break;
                    }
                }

                if (allItemsInserted)
                {
                    Session["Cart"] = null;
                    Response.Redirect("thankyou.aspx");
                }
                else
                {
                    // Handle the case where one or more items failed to be inserted
                }
            }
            else
            {
                // Porudžbina failed to be created
                // Handle the error or display a message to the user
            }
        }

    }
}