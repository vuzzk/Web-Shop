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
                        
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>"
                                SelectCommand="SELECT ime, prezime, username, lozinka, email, drzava, grad, postanski_br, adresa,uloga_korisnika_id 
                                                FROM [Korisnici] WHERE email = @Email">
                                <SelectParameters>
                                    <asp:Parameter Name="Email" Type="String"/>
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                <div class="form-group">
                                    <label for="txtEditName">Ime:</label>
                                    <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditSurname">Prezime:</label>
                                    <asp:TextBox ID="txtEditSurname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditUsername">Korisničko ime:</label>
                                    <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditMail">Mejl:</label>
                                    <asp:TextBox ID="txtEditMail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditCountry">Država:</label>
                                    <asp:TextBox ID="txtEditCountry" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditCity">Grad:</label>
                                    <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditPostCode">Poštanski broj:</label>
                                    <asp:TextBox ID="txtEditPostCode" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtEditAddress">Adresa:</label>
                                    <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="DropDownListRole">Uloga:</label>
                                    <asp:DropDownList ID="DropDownListRole" runat="server" DataSourceID="SqlDataSource2" DataTextField="naziv" DataValueField="uloga_korisnika_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT * FROM [UlogeKorisnika]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                                </div>
                                <asp:Button ID="btnSave" runat="server" Text="Sačuvaj" CssClass="btn btn-success" style="margin-top: 10px" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Prekini" CssClass="btn btn-danger" style="margin-top: 10px" OnClick="btnCancel_Click" />
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
