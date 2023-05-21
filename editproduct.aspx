<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="Web_Shop.editproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 100px; margin-top: 10px">

        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Proizvod</h3>
            </div>
            <div class="col-md-6 text-right">
                <asp:Button ID="btnBack" runat="server" Text="Nazad na listu proizvoda" CssClass="btn btn-primary float-right" OnClick="btnBack_Click" />
            </div>
        </div>

        <hr />

        <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>


        <div class="form-group">
            <h5>Ime</h5>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Šifra</h5>
            <asp:TextBox ID="txtSKU" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Cena</h5>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Količina</h5>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Proizvođač</h5>
            <asp:TextBox ID="txtManufacturer" runat="server" CssClass="form-control shadow" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top: 10px;">Kategorija</h5>
            <asp:DropDownList ID="DropDownListCat" runat="server" DataSourceID="SqlDataSource1" DataTextField="ime" DataValueField="kategorija_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT kategorija_id, ime FROM [Kategorije]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Opis</h5>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control shadow" TextMode="MultiLine" ReadOnly="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Slika proizvoda</h5>
            <asp:Image ID="imgProduct" runat="server" CssClass="product-image" style="max-height: 200px;" AlternateText="Product Image" />
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Zameni sliku</h5>
            <asp:FileUpload ID="fileProductImage" runat="server" CssClass="form-control-file" />        
        </div>

        

        <asp:Button ID="btnSaveChanges" runat="server" style="margin-top:30px;" Text="Sačuvaj izmene" CssClass="btn btn-outline-success text-center" OnClick="btnSaveChanges_Click"/>
    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
