<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="Web_Shop.thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid position-relative" style="background-image: url('Resources/baner3.png'); height: calc(100vh - 56px); background-size: cover;">
        <div class="mask"></div>
        <div class="container containerCenter text-center">
            <h1 class="text-white font-weight-bold" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Hvala vam što kupujete kod nas!</h1>
            <a class="btn btn-outline-light btn-lg btn-thick" href="shop.aspx" role="button">POČETNA STRANA</a>
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

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
