<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Web_Shop.shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 mt-4">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnSearch" runat="server" Text="Pretraga" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-4">
                <div class="row">
                    <asp:Repeater ID="rptProducts" runat="server" DataSourceID="SqlDataSourceProducts" OnItemCommand="rptProducts_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-3 mb-4">
                                <div class="card">
                                    <img src='<%# GetProductImage(Eval("sifra")) %>' class="card-img-top" alt="<%# GetProductImage(Eval("sifra")) %>">
                                    <div class="card-body text-center">
                                        <h5 class="card-title"><%# Eval("ime") %></h5>
                                        <p class="card-text">Kategorija: <%# Eval("kategorija") %></p>
                                        <p class="card-text">Šifra: <%# Eval("sifra") %></p>
                                        <p class="card-text">Cena: $<%# Eval("cena") %></p>

                                        <asp:Button ID="btnSeeProduct" runat="server" Text="VIDI PROIZVOD" CssClass="btn btn-primary" OnClick="btnSeeProduct_Click"
                                            CommandArgument='<%# Eval("sifra") %>' CommandName="ViewProduct" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT Ime, Sifra, Cena, Kategorija FROM ProdavnicaPrikaz"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
