<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Web_Shop.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="mb-4" style="margin-top: 20px">Proizvodi</h1>       

        <div class="alert alert-warning" id="successMessageDelete" runat="server" visible="false">
            Korisnik obrisan!
            <asp:Button ID="btnCloseSuccess" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT ime,sifra,cena,kolicina,kategorija_ime FROM [PregledProizvoda]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table table-stripped table-hover thead-dark " OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Ime">
                    <ItemTemplate>
                        <%# Eval("ime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Šifra">
                    <ItemTemplate>
                        <%# Eval("sifra") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cena (€)">
                    <ItemTemplate>
                        <%# Eval("cena") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Količina">
                    <ItemTemplate>
                        <%# Eval("kolicina") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kategorija">
                    <ItemTemplate>
                        <%# Eval("kategorija_ime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Akcije">
                    <ItemTemplate>
                        <div >
                            <asp:Button ID="btnEdit" runat="server" Text="Izmeni" CssClass="btn btn-primary" OnClick="btnEdit_Click" CommandArgument='<%# Eval("sifra") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Obriši" CssClass="btn btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("sifra") %>' />                            
                        </div>  
                      
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
