<%@ Page Title="Moj nalog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="Web_Shop.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 100px; margin-top: 10px">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.aspx">Početna</a></li>
                <li class="breadcrumb-item active" aria-current="page">Moj nalog</li>
            </ol>
        </nav>

        <hr />

        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Moj nalog</h3>
            </div>
            <div class="col-md-6 text-right">
                <asp:Button ID="btnEditAccount" runat="server" Text="Izmeni nalog" CssClass="btn btn-outline-primary float-right" OnClick="btnEditAccount_Click" />
            </div>
        </div>

        <hr />

        <div class="form-group">
            <h5>Name</h5>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Surname</h5>
            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Username</h5>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Email</h5>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Password</h5>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control shadow" TextMode="Password" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Country</h5>
            <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">City</h5>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Post Code</h5>
            <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <h5 style="margin-top:10px;">Address</h5>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control shadow" ReadOnly="true"></asp:TextBox>
        </div>

        <asp:Button ID="btnSaveChanges" runat="server" style="margin-top:30px;" Text="Save Changes" CssClass="btn btn-outline-success text-center" OnClick="btnSaveChanges_Click" Visible="false"/>
    </div>


    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
