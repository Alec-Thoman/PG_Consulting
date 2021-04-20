<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeLoginPageBStrap.aspx.cs" Inherits="Lab2.EmployeeLoginPageBStrap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="employee/employee-login-styles.css">
    <%--<link href="Content/bootstrap.css" rel ="stylesheet" />--%>
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
                                    <%--<input name="" class="form-control" placeholder="Email" type="email">--%>
                                    <%--<asp:TextBox ID="emailTB" runat="server" placeholder="Email" class="form-control"></asp:TextBox>--%>
                                    <input id="txtEmail" name="" runat="server" class="form-control" placeholder="Email">
                                </div>
                                <!--form-group-->
                                <div class="form-group">
                                    <a class="float-right" href="#">Forgot?</a>
                                    <label>Your password</label>
                                    <%--<input class="form-control" placeholder="******" type="password">--%>
                                    <input id="txtPassword" runat="server" class="form-control" placeholder="******" >
                                    <%--type="password"--%>
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
                                    <%--<a class="btn btn-primary js-scroll-trigger" href="employee-index.html">Login</a>--%>
                                    <asp:Button ID="loginButton" runat="server" Text="Login" class="btn btn-primary js-scroll-trigger" OnClick="btnLogin_Click"/>
                                    <asp:Button ID="backtostartpage" runat="server" Text="Return to start page" class="btn btn-primary js-scroll-trigger" OnClick="backtostartpage_Click"/>
                                     <asp:Button ID="popButton" runat="server" Text="Populate" class="btn btn-primary js-scroll-trigger" OnClick="populate_Click"/>
                                </div>
                                <!--form-group-->
                                <label id="lblStatus"></label>
                            </article>
                    </aside>
                </div>
            </div>
        </form>
        

    </div>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>

</body>
</html>
</asp:Content>
