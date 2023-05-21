using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class orderdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int broj_porudzbine = (int)Session["OrderDetails"];
                SqlDataSource1.SelectParameters["orderNumber"].DefaultValue = Session["OrderDetails"].ToString();

                WebShop porudzbina = new WebShop();

                string mail = porudzbina.Mejl_Kupca(broj_porudzbine);
                string napomena = porudzbina.Napomena_Porudzbine(broj_porudzbine);
                DataSet userData = porudzbina.Korisnik(mail);

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
                txtDesc.Text = napomena;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session["OrderDetails"] = null;
            Response.Redirect("orders.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}