<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="Web_Shop.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h1>Dobrodošli u kontrolni panel!</h1>
        <hr />
        <div class="row mt-2">
            <div class="col-md-12">
                <div class="card border-primary shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="card-title" style="font-size: 2rem;">Broj proizvoda:</h5>
                            <asp:Label ID="lblProductCount" CssClass="card-text text-center text-primary font-weight-bold" Style="font-size: 4rem; font-weight: bolder;" runat="server">151515</asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card border-primary shadow">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="card-title" style="font-size: 2rem;">Broj korisnika:</h5>
                            <asp:Label ID="lblUserCount" CssClass="card-text text-center text-primary font-weight-bold" Style="font-size: 4rem; font-weight: bolder;" runat="server">63643</asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <asp:Button ID="btnSeeShop" runat="server" Text="Vidite prodavnicu u zasebnom prozoru" CssClass="btn btn-primary" OnClick="btnSeeShop_Click" />
    </div>

    <style>
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
