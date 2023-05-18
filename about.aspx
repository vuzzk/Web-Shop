<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Web_Shop.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid position-relative" style="background-image: url('Resources/banerAboutUs.png'); height: calc(100vh - 56px); background-size: cover;">
        <div class="mask"></div>
        <div class="container containerCenter text-center">
            <h1 class="text-white font-weight-bold" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">"Šoping centar na internetu"</h1>
        </div>
    </div>

    <style>
        .containerCenter {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .mask {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.2);
        }
    </style>


    <div class="container" style="margin-top:30px; margin-bottom:100px">
        
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.aspx">Početna</a></li>
                <li class="breadcrumb-item active" aria-current="page">O nama</li>
            </ol>
        </nav>

        <hr />
        
        <div class="about-us">
            <h2 style="font-size: 3rem; font-weight:bold;">O nama</h2>

            <div class="about-us-text text-justify">
                <p>
                    Naš cilj je da pružimo potrošačima mesto na internetu gde mogu da kupe baš sve što im treba. 
                    Od konkurencije se izdvajamo ne samo ponudom već i uslugom i doživljaju kupovine.

                </p>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-6">
                <div class="card border-primary shadow">
                    <div class="card-body">
                        <h5 class="card-title" style="font-size: 2rem;">Broj proizvoda:</h5>
                        <asp:Label ID="lblProductCount" CssClass="card-text text-center text-primary font-weight-bold" style="font-size: 4rem; font-weight:bolder;" runat="server">151515</asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card border-primary shadow">
                    <div class="card-body">
                        <h5 class="card-title" style="font-size: 2rem;">Broj korisnika:</h5>
                        <asp:Label ID="lblUserCount" CssClass="card-text text-center text-primary font-weight-bold" style="font-size: 4rem; font-weight:bolder;" runat="server">63643</asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
