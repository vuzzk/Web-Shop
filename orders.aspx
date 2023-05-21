<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="Web_Shop.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
        <h1 class="mb-4" style="margin-top: 20px">Porudžbine</h1>       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT porudzbina_id,korisnik,ukupan_iznos,datum_vreme,porudzbina_uspesna FROM [PregledPorudzbina]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table table-stripped table-hover thead-dark " OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Broj porudžbine">
                    <ItemTemplate>
                        <%# Eval("porudzbina_id") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kupac">
                    <ItemTemplate>
                        <%# Eval("korisnik") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Iznos (€)">
                    <ItemTemplate>
                        <%# Eval("ukupan_iznos") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Datum i vreme">
                    <ItemTemplate>
                        <%# Eval("datum_vreme") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Uspešno">
                    <ItemTemplate>
                        <%# Eval("porudzbina_uspesna") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Akcije">
                    <ItemTemplate>
                        <div >
                            <asp:Button ID="btnSeeDetails" runat="server" Text="Vidi detalje" CssClass="btn btn-primary" OnClick="btnSeeDetails_Click" CommandArgument='<%# Eval("porudzbina_id") %>' />
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
