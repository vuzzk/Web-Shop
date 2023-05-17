<%@ Page Title="Dodajte kategoriju" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="Web_Shop.addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4">
        <h1 class="mb-4">Dodajte kategoriju</h1>
        <asp:Panel ID="formPanel" runat="server" DefaultButton="btnAddCategory" CssClass="form-horizontal">
            <div class="mb-3">
                <label for="txtCategoryName" class="form-label">Ime kategorije</label>
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtCategoryDesc" class="form-label">Opis kategorije</label>
                <asp:TextBox ID="txtCategoryDesc" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="fileCategoryImage" class="form-label">Slika kategorije</label>
                <asp:FileUpload ID="fileCategoryImage" runat="server" CssClass="form-control-file" />
            </div>
            <div class="alert alert-success" id="successMessage" runat="server" visible="false">
                Kategorija uspešno dodata!
                <asp:Button ID="btnCloseSuccess" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />            

            </div>
            <div class="alert alert-danger" id="failureMessage" runat="server" visible="false">
                Neuspešno! Kategorija nije dodata!            
                <asp:Button ID="btnCloseError" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
            </div>
            <div class="mb-3 text-center">
                <asp:Button ID="btnAddCategory" runat="server" Text="Dodaj kategoriju" CssClass="btn btn-primary" OnClick="btnAddCategory_Click" />
            </div>
        </asp:Panel>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
