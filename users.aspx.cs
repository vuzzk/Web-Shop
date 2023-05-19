using System;
using System.Collections.Generic;
using System.Data;
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
            string lozinka;
            Session["EditMail"] = email;
            Response.Redirect("edituser.aspx");
            
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}