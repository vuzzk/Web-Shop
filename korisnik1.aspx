<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="korisnik1.aspx.cs" Inherits="Web_Shop.korisnik1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="table">
                   <tr>
                      <td>
                        Naziv godina :
                      </td>
                     </tr>

    <%
        SqlConnection conn = new SqlConnection();
        string wqbConfig = ConfigurationManager.ConnectionStrings["Web-Shop"].ConnectionString;
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

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







            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Response.Write("<tr>");
                Response.Write("<td>");
                Response.Write(ds.Tables[0].Rows[i][0]);
                Response.Write("</td>");
                Response.Write("<td>");
                Response.Write("<a href=brisanjeaspx?id=" + ds.Tables[0].Rows[i]["korisnik_id"] + ">");
                Response.Write("Brisanje");
                Response.Write("</td>");
                Response.Write("<td>");
                Response.Write("<a href=update.aspx?id=" + ds.Tables[0].Rows[i]["korisnik_id"] + ">");
                Response.Write("Izmena");
                Response.Write("</td>");
                Response.Write("</tr>");
            }
        


        
        %>
        </table>
</asp:Content>
