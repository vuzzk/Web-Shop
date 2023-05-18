<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="Web_Shop.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4">
        <h1 class="mb-4">Dodajte proizvod</h1>
        <asp:Panel ID="formPanel" runat="server" DefaultButton="btnAddProduct" CssClass="form-horizontal">
            <div class="mb-3">
                <label for="txtName" class="form-label">Ime proizvoda</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtSKU" class="form-label">Šifra proizvoda</label>
                <asp:TextBox ID="txtSKU" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPrice" class="form-label">Cena</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtQuantuty" class="form-label">Količina</label>
                <asp:TextBox ID="txtQuantuty" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtProducer" class="form-label">Proizvođač</label>
                <asp:TextBox ID="txtProducer" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="DropDownListCategory" class="form-label">Kategorija</label>
                <asp:DropDownList ID="DropDownListCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="ime" DataValueField="kategorija_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT * FROM [Kategorije]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            </div>
            <div class="alert alert-success" id="successMessage1" runat="server" visible="false">
                Proizvod uspešno dodat!
                <asp:Button ID="btnCloseSuccess" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />            

            </div>
            <div class="alert alert-danger" id="failureMessage1" runat="server" visible="false">
                Neuspešno! Probajte ponovo!            
                <asp:Button ID="btnCloseError" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
            </div>
            <div class="mb-3 text-center">
                <asp:Button ID="btnAddProduct" runat="server" Text="Dodaj proizvod" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
            </div>
        </asp:Panel>
        <h2 class="mb-4">Dodajte opis proizvoda</h2>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAddProduct" CssClass="form-horizontal" Enabled="false">
            <div class="mb-3">
                <label for="txtDescription" class="form-label">Opis</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="fileProductImage" class="form-label">Slika proizvoda</label>
                <asp:FileUpload ID="fileProductImage" runat="server" CssClass="form-control-file" />
            </div>
            
            <div class="alert alert-success" id="successMessage2" runat="server" visible="false">
                Opis uspešno dodat!
                <asp:Button ID="Button1" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />            

            </div>
            <div class="alert alert-danger" id="failureMessage2" runat="server" visible="false">
                Neuspešno! Probajte ponovo!            
                <asp:Button ID="Button2" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
            </div>
            <div class="mb-3 text-center">
                <asp:Button ID="Button3" runat="server" Text="Dodaj opis" CssClass="btn btn-primary" OnClick="btnAddDescription_Click" />
            </div>
        </asp:Panel>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
