<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editcategory.aspx.cs" Inherits="Web_Shop.editcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container" style="margin-bottom: 100px; margin-top: 10px">

        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Kategorija</h3>
            </div>
            <div class="col-md-6 text-right">
                <asp:Button ID="btnBack" runat="server" Text="Nazad na listu kategorija" CssClass="btn btn-primary float-right" OnClick="btnBack_Click" />
            </div>
        </div>

        <hr />

        <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>


        <div class="form-group">
            <h5>Ime kategorije</h5>
            <asp:TextBox ID="txtName" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Opis kategorije</h5>
            <asp:TextBox ID="txtDescription" runat="server" EnableViewState="true" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <asp:Button ID="btnSaveChanges" runat="server" style="margin-top:30px;" Text="Sačuvaj izmene" CssClass="btn btn-outline-success text-center" OnClick="btnSaveChanges_Click"/>
    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
