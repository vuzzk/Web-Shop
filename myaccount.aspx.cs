using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Shop;

namespace Web_Shop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string mail;
        int role;
        bool signed = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    mail = Session["mail"].ToString();
                    role = (int)Session["user_role"];
                    signed = true;

                    WebShop moj_nalog = new WebShop();
                    DataSet userData = moj_nalog.Korisnik(mail);

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
                    }
                }
                else
                {
                    Response.Redirect("SignIn.aspx");
                }
            }
        }

        protected void btnEditAccount_Click(object sender, EventArgs e)
        {
            txtName.ReadOnly = false;
            txtSurname.ReadOnly = false;
            txtUsername.ReadOnly = false;
            txtPassword.ReadOnly = false;
            txtCountry.ReadOnly = false;
            txtCity.ReadOnly = false;
            txtPostCode.ReadOnly = false;
            txtAddress.ReadOnly = false;

            btnSaveChanges.Visible = true;
            btnEditAccount.Enabled = false;

            
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
            int user_role = role;

            WebShop moj_nalog1 = new WebShop();
            int izmena_korisnika = moj_nalog1.Izmena_Korisnika(name, surname, username, password, email, country, city, postCode, address, (int)Session["user_role"]);

            if (izmena_korisnika == 0)
            {
                lblError.Visible = false;
                lblError.Text = "Podaci su uspešno izmenjeni";
                lblError.CssClass = "text-success";
                lblError.Visible = true;

                btnSaveChanges.Visible = false;
                btnEditAccount.Enabled = true;
                txtName.ReadOnly = true;
                txtSurname.ReadOnly = true;
                txtUsername.ReadOnly = true;
                txtPassword.ReadOnly = true;
                txtCountry.ReadOnly = true;
                txtCity.ReadOnly = true;
                txtPostCode.ReadOnly = true;
                txtAddress.ReadOnly = true;
            }
            else
            {
                lblError.Visible = false;
                lblError.Text = "Greška! Proverite da li su uneti podaci u tačnom formatu.";
                lblError.CssClass = "text-danger";
                lblError.Visible = true;
            }

            
        }

        
    }
}