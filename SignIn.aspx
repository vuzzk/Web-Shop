<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Web_Shop.log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet">

    <title>Prijava</title>
</head>
<body style="background-color: #d9eafa;">
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card">
                <div class="card-body px-4 py-3">
                    <h5 class="card-title text-center mb-3">Prijava</h5>
                    <form>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" Type="email"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Lozinka</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" Type="password" />
                            <asp:Label ID="lblWarning" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                        </div>                  
                        <asp:Button ID="btnSignIn" runat="server" Text="Prijavite se"  CssClass="btn btn-primary d-block mx-auto mt-4" Type="submit" OnClick="btnSignIn_Click"/>
                    </form>
                    <p class="text-center mt-3 mb-0">Nemate nalog? <a href="SignUp.aspx">Registrujte se.</a></p>
                </div>
            </div>
        </div>
    </form>
    <style>
        .card {
            width: 400px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
    </style>

    <script src="Scripts/jquery-3.6.4.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
