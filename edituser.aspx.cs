using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class edituser : System.Web.UI.Page
    {
        string mail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mail = Session["EditMail"].ToString();
                WebShop izmeni_nalog = new WebShop();
                DataSet userData = izmeni_nalog.Korisnik(mail);

                if (userData != null && userData.Tables.Count > 0 && userData.Tables[0].Rows.Count > 0)
                {
                    DataRow userRow = userData.Tables[0].Rows[0];

                    txtName.Text = userRow["ime"].ToString();
                    txtSurname.Text = userRow["prezime"].ToString();
                    txtUsername.Text = userRow["username"].ToString();
                    txtEmail.Text = userRow["email"].ToString();
                    txtPassword.Text = userRow["lozinka"].ToString();
                    txtCountry.Text = userRow["grad"].ToString();
                    txtCity.Text = userRow["drzava"].ToString();
                    txtPostCode.Text = userRow["postanski_br"].ToString();
                    txtAddress.Text = userRow["adresa"].ToString();
                    DropDownListRole.SelectedValue = userRow["uloga_korisnika_id"].ToString();
                }
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string country = txtCountry.Text;
            string city = txtCity.Text;
            int postCode = Convert.ToInt32(txtPostCode.Text);
            string address = txtAddress.Text;
            int user_role = Convert.ToInt32(DropDownListRole.SelectedItem.Value);

            WebShop moj_nalog = new WebShop();
            int izmena_korisnika = moj_nalog.Izmena_Korisnika(name, surname, username, password, email, country, city, postCode, address, user_role);

            if (izmena_korisnika == 0)
            {
                lblError.Text = mail + "Podaci uspešno izmenjeni";
                lblError.CssClass = "text-success";
                lblError.Visible = true;
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
            Response.Redirect("users.aspx");
            Session["EditMail"] = null;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}