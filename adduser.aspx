<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="Web_Shop.adduser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4">
        <h1 class="mb-4">Dodajte korisnika</h1>
        <asp:Panel ID="formPanel" runat="server" DefaultButton="btnAddCategory" CssClass="form-horizontal">
            <div class="mb-3">
                <label for="txtName" class="form-label">Ime</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtSurname" class="form-label">Prezime</label>
                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtUsername" class="form-label">Korisničko ime</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtMail" class="form-label">Mejl</label>
                <asp:TextBox ID="txtMail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Lozinka</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtCountry" class="form-label">Država</label>
                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtCity" class="form-label">Grad</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPostcode" class="form-label">Poštanski broj</label>
                <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtAdress" class="form-label">Adresa</label>
                <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="DropDownListRole" class="form-label">Uloga</label>
                <asp:DropDownList ID="DropDownListRole" runat="server" DataSourceID="SqlDataSource1" DataTextField="naziv" DataValueField="uloga_korisnika_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT * FROM [UlogeKorisnika]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            </div>
            <div class="alert alert-success" id="successMessage" runat="server" visible="false">
                Korisnik uspešno dodat!
                <asp:Button ID="btnCloseSuccess" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />            </div>
            <div class="alert alert-danger" id="failureMessage" runat="server" visible="false">
                Neuspešno! Probajte ponovo!            
                <asp:Button ID="btnCloseError" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
            </div>
            <div class="mb-3 text-center">
                <asp:Button ID="btnAddCategory" runat="server" Text="Dodaj korisnika" CssClass="btn btn-primary" OnClick="btnAddCategory_Click" />
            </div>
        </asp:Panel>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
