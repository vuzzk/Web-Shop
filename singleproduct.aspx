<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="singleproduct.aspx.cs" Inherits="Web_Shop.singleproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:50px; margin-bottom:100px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="shop.aspx">Prodavnica</a></li>
                <li class="breadcrumb-item active" aria-current="page">Proizvod</li>
            </ol>
        </nav>
        
        <div class="row">
            <div class="col-md-4">
                <asp:Image ID="imgProduct" runat="server" CssClass="product-image" style="max-height:300px"/>
            </div>
            <div class="col-md-8">
                <h2 class="product-name" runat="server" id="lblProductName"></h2>
                <p><strong>Šifra:</strong> <span runat="server" id="lblSKU"></span></p>
                <p><strong>Cena:</strong> <span runat="server" id="lblPrice"></span> €</p>
                <p><strong>Kategorija:</strong> <span runat="server" id="lblCategory"></span></p>
                <p><strong>Proizvođač:</strong> <span runat="server" id="lblManufacturer"></span></p>

                <div class="quantity-container">
                    <div class="input-group">
                        <asp:Button ID="btnMinus" runat="server" Text="-" CssClass="btn btn-secondary btn-quantity" OnClick="btnMinus_Click" />
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control quantity-input" Text="1" Style="max-width: 100px; text-align: center;"></asp:TextBox>
                        <asp:Button ID="btnPlus" runat="server" Text="+" CssClass="btn btn-secondary btn-quantity" OnClick="btnPlus_Click" />
                    </div>
                </div>

                <asp:Button ID="btnAddToCart" runat="server" Text="DODAJ U KORPU" CssClass="btn btn-primary" style="margin-top:20px; margin-bottom:20px" OnClick="btnAddToCart_Click" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Opis proizvoda</h5>
                        <p class="card-text"><span runat="server" id="lblDescription"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
