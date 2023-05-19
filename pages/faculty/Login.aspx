<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flex.pages.faculty.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flex | Faculty</title>
    <link rel="stylesheet" type="text/css" href="~/assets/fontawesome/css/all.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/style/academics_login.css" />
    <link rel="shortcut icon" href="~/assets/img/favicon.ico" />
</head>
<body>
    <div class="div-split">
        <div class="div-left m-4 rounded-5">
            <div class="logo-container">
                <img src="/assets/img/flex-logo-1.png" />
                <h3>Sign In</h3>
            </div>
            <form class="login-form" id="loginForm" runat="server">
                <div class="mb-1">
                    <label for="userEmail">Email</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fal fa-user"></i>
                        </span>
                        <asp:TextBox ID="userEmail" runat="server" CssClass="form-control" placeholder="Email i.e. xyz@nu.edu.pk" aria-label="Email"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator
                        ID="rollnoValidator"
                        CssClass="text-warning"
                        ControlToValidate="userEmail"
                        ValidationExpression="^[a-z0-9.]+@nu\.edu\.pk$"
                        ErrorMessage="Invalid Email."
                        runat="server">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="mb-3">
                    <label for="userPassword">Password</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fal fa-lock"></i>
                        </span>
                        <asp:TextBox ID="userPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" aria-label="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe" />
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                    <a href="#" style="float: right;">Forgot Password?</a>
                </div>
                <div class="alert alert-info" role="alert">
                    We believe you are not a robot. ❤
                </div>
                <div class="h-5 w-100 bg-light rounded-5">
                    <asp:LinkButton ID="btnSignIn" runat="server" CssClass="btn btn-primary btn-sigin rounded-5" OnClick="btnSignIn_Click">
                            <i class="fa fa-sign-in px-2"></i>Sign In
                    </asp:LinkButton>
                    <a class="btn btn-light w-50 btn-sigin rounded-5" href="/pages/students/login.aspx">Are you Student?</a>
                </div>
                <div class="position-absolute bottom-0 start-0">
                    <a class="nav-link m-5" href="/pages/academics/login.aspx">Goto Academics Panel</a>
                </div>
            </form>
        </div>
    </div>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
