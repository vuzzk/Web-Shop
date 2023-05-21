<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Web_Shop.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 50px; margin-bottom: 100px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="shop.aspx">Prodavnica</a></li>
                <li class="breadcrumb-item active" aria-current="page">Proizvod</li>
            </ol>
        </nav>
        <h2>Korpa</h2>
        <asp:GridView ID="gvCart" runat="server" CssClass="table" AutoGenerateColumns="False" OnRowDataBound="gvCart_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Naziv" />
                <asp:BoundField DataField="SKU" HeaderText="Šifra" />
                <asp:BoundField DataField="Price" HeaderText="Cena po komadu" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Quantity" HeaderText="Količina" />   
                <asp:TemplateField HeaderText="Ukupna cena">
                    <ItemTemplate>
                        <%# Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) %>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Akcije">
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" Text="Ukloni" CssClass="btn btn-danger" CommandName="RemoveItem" CommandArgument='<%# Eval("SKU") %>' OnClick="btnRemove_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="row">
            <div class="col-md-12">
                <hr />
                <h4>Ukupna cena svih proizvoda: <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label></h4>
                <asp:Button ID="btnCheckout" runat="server" Text="Naruči" CssClass="btn btn-primary" OnClick="btnCheckout_Click" />
            </div>
        </div>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
