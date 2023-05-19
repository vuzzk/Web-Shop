using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Shop
{
    public partial class admin : System.Web.UI.Page
    {
        string adresa = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            WebShop unos_proizvoda = new WebShop();
            int rezultat_proizvod = -1;

            if (txtName.Text != "" && txtSKU.Text != "" && txtPrice.Text != "" && txtQuantuty.Text != "" && txtProducer.Text != "")
            {
               rezultat_proizvod = unos_proizvoda.Unos_Proizvoda(txtName.Text, txtSKU.Text, Convert.ToInt32(txtPrice.Text), Convert.ToInt32(txtQuantuty.Text), txtProducer.Text, Convert.ToInt32(DropDownListCategory.SelectedItem.Value));

            }
            else
            {
                failureMessage1.Visible = true;
            }

            if (rezultat_proizvod == 0)
            {
                Session["sifra_proizvoda"] = txtSKU.Text;
                successMessage1.Visible = true;

                Panel1.Enabled = true;
            }
            else
            {
                failureMessage1.Visible = true;
            }
        }

        protected void btnAddDescription_Click(object sender, EventArgs e)
        {
            
            string filePath = string.Empty;
            if (fileProductImage.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(fileProductImage.FileName);
                if (fileextension.ToLower() !=  ".png")
                {
                    failureMessage2.Visible = true;
                }
                else
                {
                    int filesize = fileProductImage.PostedFile.ContentLength;
                    if(filesize > 2242880)
                    {
                        failureMessage2.Visible = true;
                    }
                    else
                    {
                        fileProductImage.SaveAs(Server.MapPath("./Uploads/" + fileProductImage.FileName));
                        adresa = "./Uploads/" + fileProductImage.FileName;

                    }
                }
             
            }

            WebShop unos_opisa = new WebShop();
            int rezultat_opis = -1;

            if (txtDescription.Text != "")
            {
                rezultat_opis = unos_opisa.Unos_Opisa(txtDescription.Text, Session["sifra_proizvoda"].ToString(), adresa, adresa, adresa, adresa);
                if (rezultat_opis == 0)
                {
                    successMessage2.Visible = true;
                }
                else
                {
                    failureMessage2.Visible = true;
                }
            }
            else
            {
                failureMessage2.Visible = true;
            }

            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            successMessage2.Visible=false;
            successMessage1.Visible=false;
            failureMessage1.Visible=false;
            failureMessage2.Visible=false;
        }
    }
}