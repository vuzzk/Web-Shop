using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string mail;
        bool signed = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
                {
                    mail = Session["mail"].ToString();
                    signed = true;

                    //DataSet userData = Korisnik(mail);

                    //if (userData != null && userData.Tables.Count > 0 && userData.Tables[0].Rows.Count > 0)
                    //{
                    //    DataRow userRow = userData.Tables[0].Rows[0];

                    //    txtName.Text = userRow["name"].ToString();
                    //    txtSurname.Text = userRow["surname"].ToString();
                    //    txtUsername.Text = userRow["username"].ToString();
                    //    txtEmail.Text = userRow["email"].ToString();
                    //    txtPassword.Text = userRow["password"].ToString();
                    //    txtCountry.Text = userRow["country"].ToString();
                    //    txtCity.Text = userRow["city"].ToString();
                    //    txtPostCode.Text = userRow["postCode"].ToString();
                    //    txtAddress.Text = userRow["address"].ToString();
                    //}
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
            btnSaveChanges.Visible = false;
            btnEditAccount.Enabled = true;
        }
    }
}