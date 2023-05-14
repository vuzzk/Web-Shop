<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Web_Shop.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet" >
    <link href="Content/bootstrap.grid.css" rel="stylesheet">

    <title>Kreiranje naloga</title>
</head>
<body style="background-color: #d9eafa;">
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center vh-100" runat="server" id="part1" Visible="true">
            <div class="card">
                <div class="card-body px-4 py-3">
                    <h5 class="card-title text-center mb-3">Part One</h5>
                    <div class="form-group">
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email" Type="email" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" />
                    </div>
                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-primary d-block mx-auto mt-4" OnClick="btnNext_Click" />
                </div>
            </div>
        </div>

        <div class="container d-flex justify-content-center align-items-center vh-100"  runat="server" id="part2" Visible="false">
            <div class="card">
                <div class="card-body px-4 py-3">
                    <h5 class="card-title text-center mb-3">Part Two</h5>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter name" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter surname" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Enter country" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCity" runat="server" Text="Country"></asp:Label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter city" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPostCode" runat="server" Text="Country"></asp:Label>
                        <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter post code" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblAdress" runat="server" Text="Country"></asp:Label>
                        <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control" placeholder="Enter adress" />
                    </div>
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary d-block mx-auto mt-4" OnClick="btnNext_Click" />
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-primary d-block mx-auto mt-4" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
    </form>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
</body>
</html>
