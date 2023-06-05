<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Web_Shop.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 50px; margin-bottom: 100px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="cart.aspx">Korpa</a></li>
                <li class="breadcrumb-item active" aria-current="page">Plaćanje</li>
            </ol>
        </nav>
        <h2>Plaćanje</h2>

        <div class="row">
            <div class="col-md-6">
                <h4>Informacije o korisniku</h4>
                <hr />
                <div class="form-group">
                    <label for="txtName">Ime</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSurname">Prezime</label>
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Mejl</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCountry">Država</label>
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCity">Grad</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPostalCode">Poštanski broj</label>
                    <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Adresa</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Rows="3" ></asp:TextBox>
                </div>
                
            </div>
            <div class="col-md-6">
                <h4>Pregled porudžbine</h4>
                <hr />
                <div class="form-group">
                    <label for="lblTotalAmount">Iznos za plaćanje</label>
                    <asp:Label ID="lblTotalAmount" runat="server" CssClass="form-control" Text=""></asp:Label>
                </div>
                <div class="form-group">
                    <label for="txtDesc">Napomena</label>
                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" Rows="3"  TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="labelError" runat="server" CssClass="form-control text-bg-danger" Text="" Visible="false"></asp:Label>
                </div>
                <div class="col-md-12 text-center">
                    <asp:Button ID="Button1" runat="server" Text="Potvrdi porudžbinu" style="margin-top: 30px; font-size: 2rem;" CssClass="btn btn-primary" OnClick="btnConfirmOrder_Click" />
                </div>
            </div>
        </div>

    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
