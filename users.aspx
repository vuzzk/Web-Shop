<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="Web_Shop.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <div class="container">
        <h1 class="mb-4" style="margin-top: 20px">Korisnici</h1>       

        <div class="alert alert-warning" id="successMessageDelete" runat="server" visible="false">
            Korisnik obrisan!
            <asp:Button ID="btnCloseSuccess" runat="server" type="button" data-dismiss="alert" aria-label="Close" Text="" CssClass="btn-close" OnClick="btnClose_Click" />
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT ime,prezime,email,uloga_korisnika_id FROM [Korisnici]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table table-stripped table-hover thead-dark " OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Ime">
                    <ItemTemplate>
                        <%# Eval("ime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prezime">
                    <ItemTemplate>
                        <%# Eval("prezime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mejl">
                    <ItemTemplate>
                        <%# Eval("email") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Uloga">
                    <ItemTemplate>
                        <%# Eval("uloga_korisnika_id") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <div >
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" CommandArgument='<%# Eval("email") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("email") %>' />
                        
                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                <div class="form-group">
                                    <label for="txtEditName">Name:</label>
                                    <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditSurname">Surname:</label>
                                    <asp:TextBox ID="txtEditSurname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditCountry">Country:</label>
                                    <asp:TextBox ID="txtEditCountry" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditCity">City:</label>
                                    <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditPostCode">Post Code:</label>
                                    <asp:TextBox ID="txtEditPostCode" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditAddress">Address:</label>
                                    <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditRole">Role:</label>
                                    <asp:TextBox ID="txtEditRole" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:Button ID="btnSave" runat="server" Text="Sačuvaj" CssClass="btn btn-success" style="margin-top: 10px" OnClick="btnSave_Click" />
                            </asp:Panel>
                        </div>  
                      
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
</asp:Content>
