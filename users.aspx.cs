﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string email = btnEdit.CommandArgument;
            ViewState["Mail"] = email;
            GridViewRow row = (GridViewRow)btnEdit.NamingContainer;
            Panel editSubContainer = (Panel)row.FindControl("Panel1");

            if (editSubContainer != null)
            {
                editSubContainer.Visible = true;

                TextBox txtEditName = (TextBox)row.FindControl("txtEditName");
                TextBox txtEditSurname = (TextBox)row.FindControl("txtEditSurname");
                TextBox txtEditCountry = (TextBox)row.FindControl("txtEditCountry");
                TextBox txtEditCity = (TextBox)row.FindControl("txtEditCity");
                TextBox txtEditPostCode = (TextBox)row.FindControl("txtEditPostCode");
                TextBox txtEditAddress = (TextBox)row.FindControl("txtEditAddress");
                TextBox txtEditRole = (TextBox)row.FindControl("txtEditRole");

                if (txtEditName != null && txtEditSurname != null && txtEditCountry != null && txtEditAddress != null && txtEditCity != null && txtEditRole != null && txtEditPostCode != null)
                {
                    ViewState["Name"] = txtEditName.Text;
                    ViewState["Surname"] = txtEditSurname.Text;
                    ViewState["Country"] = txtEditCountry.Text;
                    ViewState["City"] = txtEditCity.Text;
                    ViewState["PostCode"] = txtEditPostCode.Text;
                    ViewState["Address"] = txtEditAddress.Text;
                    ViewState["Role"] = txtEditRole.Text;
                }

                editSubContainer.Style["display"] = "block";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = ViewState["Name"] as string;
            string surname = ViewState["Surname"] as string;
            string mail = ViewState["Mail"] as string;
            string country = ViewState["Country"] as string;
            string city = ViewState["City"] as string;
            string postCode = ViewState["PostCode"] as string;
            string address = ViewState["Address"] as string;
            string role = ViewState["Role"] as string;

            WebShop izmena_korisnika = new WebShop();
            int rezultat_korisnik = izmena_korisnika.Izmena_Korisnika(name, surname, mail, country, city, Convert.ToInt32(postCode), address, Convert.ToInt32(role));

            if (rezultat_korisnik == 0)
            {
                Response.Redirect("users.aspx");
            }
            else
            {

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string email = btnDelete.CommandArgument;

            WebShop brisanje_korisnika = new WebShop();
            int rezultat_korisnik = brisanje_korisnika.Brisanje_Korisnika(email);

            if (rezultat_korisnik == 0)
            {
                successMessageDelete.Visible = true;
                Response.Redirect("users.aspx");
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