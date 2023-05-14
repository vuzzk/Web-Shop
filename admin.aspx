<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Web_Shop.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    Unos kategorije : <asp:TextBox ID="txtkategorija" runat="server"></asp:TextBox>
        <br />
        Opis : <asp:TextBox ID="txtopis_kat" runat="server" OnTextChanged="txtopis_kat_TextChanged"></asp:TextBox>
        <br />
        Slika :<asp:TextBox ID="txtslika" runat="server"></asp:TextBox>
        <br />
       
        
        <asp:Button ID="btn_kategorija" runat="server" Text="Unos" OnClick="btn_kategorija_Click" />
    </div>


    <div>
    Ime Proizvoda : <asp:TextBox ID="txtimeproizvoda" runat="server"></asp:TextBox> <br />
    Sifra Proizvoda : <asp:TextBox ID="txtsifraporizvoda" runat="server"></asp:TextBox> <br />
    Cena Proizvoda : <asp:TextBox ID="txtcenaproizvoda" runat="server"></asp:TextBox> <br />
    Kolicina Proizvoda : <asp:TextBox ID="txtkolicinaproizvoda" runat="server"></asp:TextBox> <br />
    Proizvodjac Proizvoda : <asp:TextBox ID="txtproizvodjacproizvoda" runat="server"></asp:TextBox> <br />
    Kategorija Proizvoda : 
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ime" DataValueField="kategorija_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT * FROM [Kategorije]"></asp:SqlDataSource>
        <br />
        
        
        
        <asp:Button ID="btn_proizvoda" runat="server" Text="Unos" OnClick="Button2_Click" />

        
        
    </div>
    Opis : <asp:TextBox ID="txtopis" runat="server" TextMode="MultiLine" Height="78px" Width="906px"></asp:TextBox>
    <br />
    Slika 1 : <asp:TextBox ID="img_opis" runat="server" Width="492px"></asp:TextBox>
    <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT * FROM [Kategorije]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <div>

    </div>
</asp:Content>
