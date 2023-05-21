using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using static System.Net.Mime.MediaTypeNames;

namespace Web_Shop
{
    public class WebShop
    {
        SqlConnection conn = new SqlConnection();
        string wqbConfig = ConfigurationManager.ConnectionStrings["Web-Shop"].ConnectionString;
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        public int Unos_Korisnika(string ime, string prezime, string username, string lozinka, string email, string drzava, string grad, int postanski_br, string adresa, int uloga_korisnika_id)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Korisnik_Insert";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            comm.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, username));
            comm.Parameters.Add(new SqlParameter("@lozinka", SqlDbType.NVarChar, 255, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 255, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@drzava", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, drzava));
            comm.Parameters.Add(new SqlParameter("@grad", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, grad));
            comm.Parameters.Add(new SqlParameter("@postanski_br", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, postanski_br));
            comm.Parameters.Add(new SqlParameter("@adresa", SqlDbType.NVarChar, 255, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, adresa));
            comm.Parameters.Add(new SqlParameter("@uloga_korisnika_id", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, uloga_korisnika_id));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }
        public int Brisanje_Korisnika(string email)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Korisnik_Delete";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Izmena_Korisnika(string ime, string prezime, string username, string lozinka, string email, string drzava, string grad, int postanski_br, string adresa, int uloga_korisnika_id)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Korisnik_Izmeni";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            comm.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, username));
            comm.Parameters.Add(new SqlParameter("@lozinka", SqlDbType.NVarChar, 255, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@drzava", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, drzava));
            comm.Parameters.Add(new SqlParameter("@grad", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, grad));
            comm.Parameters.Add(new SqlParameter("@postanski_br", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, postanski_br));
            comm.Parameters.Add(new SqlParameter("@adresa", SqlDbType.NVarChar, 255, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, adresa));
            comm.Parameters.Add(new SqlParameter("@uloga_korisnika_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, uloga_korisnika_id));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Provera_Korisnika(string email,string lozinka)
        {
            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnik_Email";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@loz", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Provera_Admina(string email, string lozinka)
        {
            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnik_Email_Admin";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@loz", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Uloga_Korisnika(string email)
        {
            int uloga_id = -1;

            conn.ConnectionString = wqbConfig;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnik_Uloga";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            SqlParameter  roleParameter = new SqlParameter("@uloga_korisnika_id", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, uloga_id);
            comm.Parameters.Add(roleParameter);

            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            uloga_id = (int)roleParameter.Value;
            return uloga_id;
        }

        public int Unos_Kategorija(string ime,string opis,string slika)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Kategorije_Insert";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@opis", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, opis));
            comm.Parameters.Add(new SqlParameter("@slika", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika));
 
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }


        public int Unos_Proizvoda(string ime, string sifra, int cena, int kolicina, string proizvodjac, int kategorija_id)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Proizvodi_Insert";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@cena", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, cena));
            comm.Parameters.Add(new SqlParameter("@kolicina", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kolicina));
            comm.Parameters.Add(new SqlParameter("@proizvodjac", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, proizvodjac));
            comm.Parameters.Add(new SqlParameter("@kategorija_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kategorija_id));

            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Izmena_Proizvoda(string ime, string sifra, int cena, int kolicina, string proizvodjac, int kategorija_id)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Proizvodi_Update";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@cena", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, cena));
            comm.Parameters.Add(new SqlParameter("@kolicina", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kolicina));
            comm.Parameters.Add(new SqlParameter("@proizvodjac", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, proizvodjac));
            comm.Parameters.Add(new SqlParameter("@kategorija_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kategorija_id));

            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Unos_Opisa(string tekst, string sifra_proizvoda, string slika1, string slika2, string slika3, string slika4)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Opisi_Insert_1";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@tekst", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, tekst));
            comm.Parameters.Add(new SqlParameter("@sifra_proizvoda", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra_proizvoda));
            comm.Parameters.Add(new SqlParameter("@slika1", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika1));
            comm.Parameters.Add(new SqlParameter("@slika2", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika2));
            comm.Parameters.Add(new SqlParameter("@slika3", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika3));
            comm.Parameters.Add(new SqlParameter("@slika4", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika4));

            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Izmena_Opisa(string tekst, string sifra_proizvoda, string slika1, string slika2, string slika3, string slika4)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Opisi_Update";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@tekst", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, tekst));
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra_proizvoda));
            comm.Parameters.Add(new SqlParameter("@slika1", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika1));
            comm.Parameters.Add(new SqlParameter("@slika2", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika2));
            comm.Parameters.Add(new SqlParameter("@slika3", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika3));
            comm.Parameters.Add(new SqlParameter("@slika4", SqlDbType.NVarChar, 150, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika4));

            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public DataSet Korisnik(string email)
        {
            conn.ConnectionString = wqbConfig;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnik_Nalog";
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            da.SelectCommand = comm;
            da.Fill(ds);

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

            return (ds);
        }

        public DataSet Svi_Korisnici()
        {
            conn.ConnectionString = wqbConfig;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnici_Select";
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            da.SelectCommand = comm;
            da.Fill(ds);

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

            return (ds);
        }

        public int Broj_Korisnika()
        {
            int broj = 0;

            using (SqlConnection conn = new SqlConnection(wqbConfig))
            {
                using (SqlCommand comm = new SqlCommand("Broj_Korisnika", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    SqlParameter countParameter = new SqlParameter("@BrojKorisnika", SqlDbType.Int);
                    countParameter.Direction = ParameterDirection.Output;
                    comm.Parameters.Add(countParameter);

                    conn.Open();
                    comm.ExecuteNonQuery();

                    broj = (int)countParameter.Value;

                    conn.Close();
                }
            }

            return broj;
        }

        public int Broj_Proizvoda()
        {
            int broj = 0;

            using (SqlConnection conn = new SqlConnection(wqbConfig))
            {
                using (SqlCommand comm = new SqlCommand("Broj_Proizvoda", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    SqlParameter countParameter = new SqlParameter("@BrojProizvoda", SqlDbType.Int);
                    countParameter.Direction = ParameterDirection.Output;
                    comm.Parameters.Add(countParameter);

                    conn.Open();
                    comm.ExecuteNonQuery();

                    broj = (int)countParameter.Value;

                    conn.Close();
                }
            }

            return broj;
        }

        public string Slika_Proizvoda(string sifra)
        {
            conn.ConnectionString = wqbConfig;
            string url;
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "dbo.Opis_GlavnaSlika";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 500, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@slika1",SqlDbType.NVarChar, 500, ParameterDirection.Output, false, 0, 0, "", DataRowVersion.Current, null));

            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
 
            url = comm.Parameters["@slika1"].Value.ToString();
            return url;
        }

        public int Brisanje_Proizvoda(string sifra)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Proizvodi_Delete";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Brisanje_Opisa(string sifra)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Opisi_Delete";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public DataSet Proizvod(string sku)
        {
            conn.ConnectionString = wqbConfig;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Proizvod_Prikaz";
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sku));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            da.SelectCommand = comm;
            da.Fill(ds);

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

            return (ds);
        }

        public DataSet Proizvod_Single(string sku)
        {
            conn.ConnectionString = wqbConfig;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Proizvod_Single_Prikaz";
            comm.Parameters.Add(new SqlParameter("@sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sku));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            da.SelectCommand = comm;
            da.Fill(ds);

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

            return (ds);
        }

        public int Brisanje_Kategorije(string ime)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Kategorije_Delete";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public int Kreiraj_Porudzbinu(string mail, int totalSum, string success, string desc)
        {
            int broj_racuna = 0;

            using (SqlConnection conn = new SqlConnection(wqbConfig))
            {
                using (SqlCommand comm = new SqlCommand("Kreiraj_Porudzbinu", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    comm.Parameters.Add(new SqlParameter("@korisnik_email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mail));
                    comm.Parameters.Add(new SqlParameter("@ukupan_iznos", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, totalSum));
                    comm.Parameters.Add(new SqlParameter("@porudzbina_uspesna", SqlDbType.NVarChar, 2, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, success));
                    comm.Parameters.Add(new SqlParameter("@napomena", SqlDbType.NVarChar, int.MaxValue, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, desc));
                    SqlParameter ordernumberParameter = new SqlParameter("@porudzbina_id", SqlDbType.Int);
                    ordernumberParameter.Direction = ParameterDirection.Output;
                    comm.Parameters.Add(ordernumberParameter);

                    conn.Open();
                    comm.ExecuteNonQuery();

                    // Retrieve the output parameter value
                    broj_racuna = (int)ordernumberParameter.Value;

                    conn.Close();
                }
            }

            return broj_racuna;
        }

        public int Stavka_Porudzbine(int order_number, string product_sku, int quantity)
        {
            int rezultat;
            using (SqlConnection conn = new SqlConnection(wqbConfig))
            using (SqlCommand comm = new SqlCommand("Stavka_Porudzbine_Insert", conn))
            {
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@porudzbina_id", SqlDbType.Int)).Value = order_number;
                comm.Parameters.Add(new SqlParameter("@proizvod_sifra", SqlDbType.NVarChar, 12)).Value = product_sku;
                comm.Parameters.Add(new SqlParameter("@kolicina", SqlDbType.Int)).Value = quantity;

                SqlParameter returnValueParam = new SqlParameter("@RETURN_VALUE", SqlDbType.Int);
                returnValueParam.Direction = ParameterDirection.ReturnValue;
                comm.Parameters.Add(returnValueParam);

                conn.Open();
                comm.ExecuteNonQuery();

                int Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
                if (Ret == 0)
                {
                    rezultat = 0;
                }
                else if (Ret == -2)
                {
                    rezultat = 2;
                }
                else { rezultat = 1; }
            }
            return rezultat;
        }

        public string Mejl_Kupca(int order_number)
        {
            string mejl = "";

            using (SqlConnection conn = new SqlConnection(wqbConfig))
            {
                using (SqlCommand comm = new SqlCommand("Mejl_Kupca", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    comm.Parameters.Add(new SqlParameter("@porudzbina_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, order_number));
                    SqlParameter mailParameter = new SqlParameter("@korisnik_email", SqlDbType.NVarChar,50);
                    mailParameter.Direction = ParameterDirection.Output;
                    comm.Parameters.Add(mailParameter);

                    conn.Open();
                    comm.ExecuteNonQuery();

                    // Retrieve the output parameter value
                    mejl = mailParameter.Value.ToString();

                    conn.Close();
                }
            }

            return mejl;
        }

        public string Napomena_Porudzbine(int order_number)
        {
            string napomena = "";

            using (SqlConnection conn = new SqlConnection(wqbConfig))
            {
                using (SqlCommand comm = new SqlCommand("Napomena_Porudzbine", conn))
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    comm.Parameters.Add(new SqlParameter("@porudzbina_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, order_number));
                    SqlParameter mailParameter = new SqlParameter("@napomena", SqlDbType.NVarChar, 50);
                    mailParameter.Direction = ParameterDirection.Output;
                    comm.Parameters.Add(mailParameter);

                    conn.Open();
                    comm.ExecuteNonQuery();

                    // Retrieve the output parameter value
                    napomena = mailParameter.Value.ToString();

                    conn.Close();
                }
            }
            return napomena;
        }

        public int Kolicina_Dostupna(string sifra, int kolicina)
        {

            conn.ConnectionString = wqbConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Kolicina";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@proizvod_sifra", SqlDbType.NVarChar, 12, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, sifra));
            comm.Parameters.Add(new SqlParameter("@kolicina", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kolicina));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
        }
    }
 
}