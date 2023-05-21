<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="edituser.aspx.cs" Inherits="Web_Shop.edituser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 100px; margin-top: 10px">

        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Nalog korisnika</h3>
            </div>
            <div class="col-md-6 text-right">
                <asp:Button ID="btnBack" runat="server" Text="Nazad na listu korisnika" CssClass="btn btn-primary float-right" OnClick="btnBack_Click" />
            </div>
        </div>

        <hr />

        <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>


        <div class="form-group">
            <h5>Ime</h5>
            <asp:TextBox ID="txtName" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Prezime</h5>
            <asp:TextBox ID="txtSurname" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Korisničko ime</h5>
            <asp:TextBox ID="txtUsername" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Mejl</h5>
            <asp:TextBox ID="txtEmail" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Lozinka</h5>
            <asp:TextBox ID="txtPassword" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Država</h5>
            <asp:TextBox ID="txtCountry" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Grad</h5>
            <asp:TextBox ID="txtCity" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Poštanski broj</h5>
            <asp:TextBox ID="txtPostCode" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Adresa</h5>
            <asp:TextBox ID="txtAddress" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top: 10px;">Uloga</h5>
            <asp:DropDownList ID="DropDownListRole" runat="server" EnableViewState="true" DataSourceID="SqlDataSource1" DataTextField="naziv" DataValueField="uloga_korisnika_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT uloga_korisnika_id, naziv FROM [UlogeKorisnika]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        </div>

        <asp:Button ID="btnSaveChanges" runat="server" style="margin-top:30px;" Text="Sačuvaj izmene" CssClass="btn btn-outline-success text-center" OnClick="btnSaveChanges_Click"/>
    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
