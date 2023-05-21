<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="orderdetails.aspx.cs" Inherits="Web_Shop.orderdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 100px; margin-top: 10px">
        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Detalji porudžbine</h3>
            </div>
            <div class="col-md-6 text-right">
                <asp:Button ID="btnBack" runat="server" Text="Nazad na listu porudžbina" CssClass="btn btn-primary float-right" OnClick="btnBack_Click" />
            </div>
        </div>

        <hr />
        <div class="row">
            <div class="col-md-6">
                <h3>Kupac</h3>
                <div class="form-group">
                    <label for="txtName">Ime:</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSurname">Prezime:</label>
                    <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Mejl:</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCountry">Država:</label>
                    <asp:TextBox ID="txtCountry" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCity">Grad:</label>
                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPostalCode">PPoštanski broj:</label>
                    <asp:TextBox ID="txtPostalCode" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Adresa:</label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>

        <hr />
        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Stavke porudžbine</h3>
            </div>
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webshopConnectionString %>" SelectCommand="SELECT ime, sifra, cena, kolicina, ukupno FROM StavkePorudzbine WHERE porudzbina_id = @orderNumber">
            <SelectParameters>
                <asp:SessionParameter Name="orderNumber" SessionField="OrderDetails" Type="Int32"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table table-stripped table-hover thead-dark " OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Ime proizvoda">
                    <ItemTemplate>
                        <%# Eval("ime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Šifra">
                    <ItemTemplate>
                        <%# Eval("sifra") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cena po komadu (€)">
                    <ItemTemplate>
                        <%# Eval("cena") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Količina">
                    <ItemTemplate>
                        <%# Eval("kolicina") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ukupno">
                    <ItemTemplate>
                        <%# Eval("ukupno") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <hr />
        <div class="row">
            <div class="col-md-6 text-right">
                <h3>Napomena porudžbine</h3>
                <div class="form-group">
                    <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
