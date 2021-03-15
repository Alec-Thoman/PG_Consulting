<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeLoginPageBStrap.aspx.cs" Inherits="Lab2.EmployeeLoginPageBStrap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Green Valley Auction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="login-styles.css">
    <link href="Content/bootstrap.css" rel ="stylesheet" />
</head>

<body>
    <!-- <div class="row">
        <img class="img-fluid" src="../assets/img/Logos/GVALogo_Green.png" alt="Green Valley Auction Logo">
    </div> -->
    <div class="row">
        <form id="form_login">
            <div class="container-fluid">
                <div class="row">
                    <aside class="col-md-5 mx-auto">
                        <div class="card shadow border-0">
                            <article class="card-body">
                                <a href="" class="float-right btn btn-outline-primary">Sign up</a>
                                <!--add link-->
                                <h1 class="card-title mb-4 mt-1">Sign in</h1>
                                <!--form-group-->
                                <div class="form-group">
                                    <label>Your email</label>
                                    <input id="txtEmail" name="" runat="server" class="form-control" placeholder="Email" type="email">
                                </div>
                                <!--form-group-->
                                <div class="form-group">
                                    <a class="float-right" href="#">Forgot?</a>
                                    <label>Your password</label>
                                    <input id="txtPassword" runat="server" class="form-control" placeholder="******" type="password">
                                </div>
                                <!--form-group-->
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label> <input type="checkbox"> Save password </label>
                                        <!--checkbox-->
                                    </div>
                                </div>
                                <!--form-group-->
                                <div class="form-group">
                                    <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary js-scroll-trigger" OnClick="btnLogin_Click"/>
                                   
                                    <%--<a id="btn" runat="server" class="btn btn-primary js-scroll-trigger" onclick="myfunction()">Login</a>--%>
                                    <script>                                        function myfunction() {                                            document.write("it is workinggggggg");                                        }                                        </script>

                                </div>
                                <!--form-group-->
                                <label id="lblStatus"></label>
                                
                            </article>
        </form>

    </div>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>

</body>
</html>
</asp:Content>
