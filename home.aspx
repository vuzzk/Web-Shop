<%@ Page Title="Početna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Web_Shop.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid position-relative" style="background-image: url('Resources/baner4.png'); height: calc(100vh - 56px); background-size: cover;">
        <div class="mask"></div>
        <div class="container containerCenter text-center">
            <h1 class="text-white font-weight-bold" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Kod nas možete pronaći BAŠ sve!</h1>
            <a class="btn btn-outline-light btn-lg btn-thick" href="shop.aspx" role="button">UVERITE SE I SAMI</a>
        </div>
    </div>

    <style>
        .containerCenter {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .btn-thick {
            border-width: 3px;
            padding: 12px 24px;
        }
    </style>


    <div class="container" style="height: 300px; margin-top: 50px">
        <div class="row">
            <div class="col-md-3">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="bi bi-archive-fill display-1 text-danger" style="font-size: 5rem;"></i>
                        <h5 class="card-title">NAJVIŠE PROIZVODA</h5>
                        <p class="card-text" style="padding-bottom:30px">Možemo da se pohvalimo najvećim i najširim asortimanom proizvoda na celom tržištu.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="bi bi-award-fill display-1 text-warning" style="font-size: 5rem;"></i>
                        <h5 class="card-title">NAJBOLJI KVALITET</h5>
                        <p class="card-text" style="margin-bottom:30px">Kvalitet prati kvantitet. Svi proizvodi u našoj ponudi su najvišeg kvaliteta.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="bi bi-cash-stack display-1 text-success" style="font-size: 5rem;"></i>
                        <h5 class="card-title">NAJBOLJE CENE</h5>
                        <p class="card-text" style="margin-bottom:30px">Proizvode sa najboljim odnosom cene i kvaliteta naći ćete upravo kod nas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="bi bi-people-fill display-1 text-primary" style="font-size: 5rem;"></i>
                        <h5 class="card-title">NAJBOLJA USLUGA</h5>
                        <p class="card-text" style="margin-bottom:30px">Korisnička podrška dostupna 24/7 i najbrža dostava u državi - to smo mi.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-primary position-relative text-white py-6 strip-background">
        <div class="mask"></div>
        <h1 class="text-center font-weight-bold position-absolute top-50 start-50 translate-middle" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Besplatna dostava za narudžbine<br />preko 20.000,00 rsd</h1>
    </div>
    <style>
        .strip-background {
            height: 300px;
            background-image: url('Resources/delivery1.png');
            background-size: cover;
            background-position: center;
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


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
